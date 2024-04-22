const { pool } = require("../database");
const bcrypt = require("bcryptjs");
const jwt = require("jsonwebtoken");

const saltRounds = 10; 

const login = (req, res) => {
  // Create the SQL query
  const sql = 'SELECT id, name, email, password, role FROM user WHERE email = ?';
  
  pool.query(sql, [req.body.email], (err, data) => {
    if (err) {
      console.log(err);
      return res.status(500).json({ error: 'Internal Server Error' });
    }

    if (data.length > 0) {
      bcrypt.compare(req.body.password.toString(), data[0].password, (err, response) => {
        if (err) {
          console.log(err);
          return res.status(500).json({ error: 'Internal Server Error' });
        }

        if (response) {
          const user = {
            id: data[0].id,
            name: data[0].name,
            email: data[0].email,
           
            role: data[0].role
          };
          
          const accessToken = jwt.sign(user, 'jwt-secret-key', { expiresIn: '30d' });
   
          return res.status(200).json({
            accessToken: accessToken,
            user: user
          });
        } else {
          return res.status(401).json({ error: 'Invalid credentials' });
        }
      });
    } else {
      return res.status(401).json({ error: 'Invalid credentials' });
    }
  });
};


const getUserData = (req,res) => {
    const getAllUsersQuery = 'SELECT id,name, email, role, created_at FROM user';

    pool.query(getAllUsersQuery, (error, results) => {
      if (error) {
        console.error('Error executing query:', error);
        return;
      }
      
      console.log('All users:', results);
      res.status(200).json(results)
    });
}

const getOneUserData = (req, res) => {
  const getOneUserQuery = 'SELECT id, name, email, password, role FROM user WHERE id = ?';

  pool.query(getOneUserQuery, [req.params.id], (error, results) => {
    if (error) {
      console.error('Error executing query:', error);
      return res.status(500).json({ error: 'Internal Server Error' });
    }

    if (results.length === 0) {
      return res.status(404).json({ error: 'User not found' });
    }

    console.log('User data:', results[0]);
    res.status(200).json(results);
  });
};


const addUser = async (req, res) => {
  const { name, email, password,role } = req.body;

  try {
    const hashedPassword = await bcrypt.hash(password, 10);

    const userQuery = `
      INSERT INTO user
      (name, email, password,role, created_at)
      VALUES (?, ?,?, ?, NOW()) 
    `;

    const values = [name, email, hashedPassword, role];

    pool.query(userQuery, values, (error, results) => {
      if (error) {
        console.error('Error executing query:', error);
        res.status(500).json({ error: 'Internal Server Error' });
        return;
      }

      console.log('Added User:', results);
      res.status(201).json({ message: 'User added successfully!' });
    });
  } catch (hashError) {
    console.error('Error hashing password:', hashError);
    res.status(500).json({ error: 'Internal Server Error' });
  }
};

const editUser = async (req, res) => {
  const { name, email, password, role } = req.body;

  try {
    let hashedPassword = null;

    // Check if a new password is provided
    if (password) {
      hashedPassword = await bcrypt.hash(password, 10);
    }

    const userQuery = `
      UPDATE user
      SET name = ?, email = ?, ${hashedPassword ? 'password = ?,' : ''}, role = ?
      WHERE id = ?
    `;

    const values = [name, email, ...(hashedPassword ? [hashedPassword] : []),role, req.params.id];

    pool.query(userQuery, values, (error, results) => {
      if (error) {
        console.error('Error executing query:', error);
        res.status(500).json({ error: 'Internal Server Error' });
        return;
      }

      console.log('Updated User:', results);
      res.status(200).json({ message: 'User updated successfully!' });
    });
  } catch (hashError) {
    console.error('Error hashing password:', hashError);
    res.status(500).json({ error: 'Internal Server Error' });
  }
};


const deleteUser = (req,res) => {
  const query = `DELETE from  user where id =?`
   
  const value = [req.body.id]
 
  pool.query(query,value, (error, results) => {
    if (error) {
      console.error('Error executing query:', error);
      return;
    }
  
    console.log('Deleted', results);
    res.json(results)
  });
}

const logout = (req, res) => {
  res.clearCookie("token", {
    httpOnly: true,
    expires: new Date(0), // Expire the cookie immediately
    sameSite: "none", // Adjust accordingly based on your requirements
  });

  return res.json({
    status: "Success",
  });
};

module.exports = { login,getUserData,getOneUserData,addUser,deleteUser,logout,editUser };