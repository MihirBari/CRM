const { pool } = require("../database");

const addContact = async (req, res) => {
  const addDealer = `
    INSERT INTO contact
    (customer_entity, name, designation, phone, email, created_at)
    VALUES (?, ?, ?, ?, ?, NOW())
  `;

  // Extract common values from the request body
  const { customer_entity } = req.body;

  // Extract contacts array from the request body
  const contacts = req.body.contacts;

  try {
    // Iterate over each contact and insert into the database
    for (const contact of contacts) {
      const { name, designation, phone, email } = contact;
      const values = [customer_entity, name, designation, phone, email];

      await new Promise((resolve, reject) => {
        pool.query(addDealer, values, (error, results) => {
          if (error) {
            console.error("Error executing query:", error);
            reject(error);
          } else {
            //console.log("Contact added successfully:", results);
            resolve();
          }
        });
      });
    }

    res.json({ message: "Contacts added successfully" });
  } catch (error) {
    console.error("Error:", error);
    res.status(500).json({ error: "Internal Server Error" });
  }
};

const addCustomer = async (req, res) => {
  const addDealer = `
    INSERT INTO customer
    (customer_entity, email, address, city, state, website)
    VALUES (?, ?, ?, ?, ?, ?)
  `;

  // Extract common values from the request body
  const { customer_entity, email, address, city, state, website } = req.body;

  try {
    // Iterate over each contact and insert into the database

    const values = [customer_entity, email, address, city, state, website];

    await new Promise((resolve, reject) => {
      pool.query(addDealer, values, (error, results) => {
        if (error) {
          console.error("Error executing query:", error);
          reject(error);
        } else {
          //console.log("Contact added successfully:", results);
          resolve();
        }
      });
    });

    res.json({ message: "Customer added successfully" });
  } catch (error) {
    console.error("Error:", error);
    res.status(500).json({ error: "Internal Server Error" });
  }
};

const showContact = (req, res) => {
  const { name, designation } = req.query;

  pool.getConnection((err, connection) => {
    if (err) {
      console.error("Error getting database connection:", err);
      res.status(500).json({ error: "Internal Server Error" });
      return;
    }

    //console.log(req.params.customer_entity)

    connection.beginTransaction((err) => {
      if (err) {
        console.error("Error beginning transaction:", err);
        res.status(500).json({ error: "Internal Server Error" });
        return connection.release();
      }

      let query = `
      SELECT 
      id, customer_entity, name, designation,phone,email, created_at
      FROM contact 
      where customer_entity = ?
          `;

      let filterConditions = [];

      if (name) {
        filterConditions.push(`name LIKE '%${name}%'`);
      }

      if (designation) {
        filterConditions.push(`designation LIKE '%${designation}%'`);
      }

      if (filterConditions.length > 0) {
        query += ` AND ${filterConditions.join(" AND ")}`;
      }

      connection.query(
        query,
        [req.params.customer_entity],
        (error, results) => {
          if (error) {
            console.error("Error executing first query:", error);
            return connection.rollback(() => {
              res.status(500).json({ error: "Internal Server Error" });
              connection.release();
            });
          }
          // Commit transaction
          connection.commit((err) => {
            if (err) {
              console.error("Error committing transaction:", err);
              return connection.rollback(() => {
                res.status(500).json({ error: "Internal Server Error" });
                connection.release();
              });
            }
            connection.release();
            res.status(200).json({ products: results });
          });
        }
      );
    });
  });
};

const showCustomer = (req, res) => {
  const { customerEntity, city } = req.query;
  console.log(customerEntity)
  pool.getConnection((err, connection) => {
    if (err) {
      console.error("Error getting database connection:", err);
      res.status(500).json({ error: "Internal Server Error" });
      return;
    }

    // Begin transaction
    connection.beginTransaction((err) => {
      if (err) {
        console.error("Error beginning transaction:", err);
        res.status(500).json({ error: "Internal Server Error" });
        return connection.release();
      }
    
      let query = `SELECT 
      id,customer_entity, email, address, city, state, website
          FROM customer`;

      let filterConditions = [];

      if (customerEntity && Array.isArray(customerEntity)) {
        const customerEntityConditions = customerEntity.map(customerEntity => `customer_entity LIKE'%${customerEntity}%'`);
        if (customerEntityConditions.length > 0) {
          filterConditions.push(`(${customerEntityConditions.join(" OR ")})`);
        }
      } else if (customerEntity) {
        filterConditions.push(`customer_entity LIKE '${customerEntity}'`);
      }

      // if (customerentity) {
      //   filterConditions.push(`customer_entity LIKE '%${customerentity}%'`);
      // }

      if (city && Array.isArray(city)) {
        const cityConditions = city.map(city => `city LIKE '%${city}%'`);
        if (cityConditions.length > 0) {
          filterConditions.push(`(${cityConditions.join(" OR ")})`);
        }
      } else if (city) {
        filterConditions.push(`city LIKE '${city}'`);
      }

      // if (city) {
      //   filterConditions.push(`city LIKE '%${city}%'`);
      // }

      if (filterConditions.length > 0) {
        query += ` WHERE ${filterConditions.join(" AND ")}`;
      }

      connection.query(query, (error, results) => {
        if (error) {
          console.error("Error executing first query:", error);
          return connection.rollback(() => {
            res.status(500).json({ error: "Internal Server Error" });
            connection.release();
          });
        }

        // Commit transaction
        connection.commit((err) => {
          if (err) {
            console.error("Error committing transaction:", err);
            return connection.rollback(() => {
              res.status(500).json({ error: "Internal Server Error" });
              connection.release();
            });
          }

          // Release connection and send response
          connection.release();
          res.status(200).json({ products: results });
        });
      });
    });
  });
};

const showOneContact = async (req, res) => {
  const dealerQuery = `
    SELECT  customer_entity, name, designation, phone, email
    FROM contact
    WHERE id = ?
  `;

  pool.query(dealerQuery, [req.params.id], (error, results) => {
    if (error) {
      console.error("Error executing query:", error);
      res.status(500).json({ error: "Internal Server Error" });
      return;
    }
    //console.log("Dealer details:", results);
    res.status(200).json(results);
  });
};

const showOneCustomer = async (req, res) => {
  const dealerQuery = `
    SELECT  customer_entity, email, address, city, state, website
    FROM customer
    WHERE id = ?
  `;

  pool.query(dealerQuery, [req.params.id], (error, results) => {
    if (error) {
      console.error("Error executing query:", error);
      res.status(500).json({ error: "Internal Server Error" });
      return;
    }
    //console.log("Dealer details:", results);
    res.status(200).json(results);
  });
};

const editContact = (req, res) => {
  const updateDealer = `
    UPDATE contact
    SET
    customer_entity = ?,
    name = ?,
    designation = ?,
    phone = ?,
    email=?,
    updated_at = NOW()
    WHERE
      id = ?;`;

  const values = [
    req.body.customer_entity,
    req.body.name,
    req.body.designation,
    req.body.phone,
    req.body.email,
    req.params.id,
  ];

  pool.query(updateDealer, values, (error, results) => {
    if (error) {
      console.error("Error executing query:", error);
      res.status(500).json({ error: "Internal Server Error" });
      return;
    }

    //console.log("Updated dealer:", results);
    res.json(results);
  });
};

const editCustomer = (req, res) => {
  const updateDealer = `
    UPDATE customer
    SET
    customer_entity = ?,
    email=?,
    address = ?,
    city = ?, 
    state = ?,
    website = ?
    WHERE
      id = ?;`;

  const values = [
    req.body.customer_entity,
    req.body.email,
    req.body.address,
    req.body.city,
    req.body.state,
    req.body.website,
    req.params.id,
  ];

  pool.query(updateDealer, values, (error, results) => {
    if (error) {
      console.error("Error executing query:", error);
      res.status(500).json({ error: "Internal Server Error" });
      return;
    }

    //console.log("Updated dealer:", results);
    res.json(results);
  });
};

const deleteContact = (req, res) => {
  const query = "DELETE FROM contact WHERE id = ?";
  const debitorName = req.body.id;

  pool.query(query, [debitorName], (error, results) => {
    if (error) {
      console.error("Error executing query:", error);
      return res.status(500).json({ error: "Internal Server Error" });
    }

    if (results.affectedRows === 0) {
      return res.status(404).json({
        error: "Not Found: No matching debitor_name found for deletion",
      });
    }

    //console.log("Deleted", results);
    res.json({ message: "Debitor deleted successfully" });
  });
};

const deleteCustomer = (req, res) => {
  const query = "DELETE FROM customer WHERE id = ?";
  const debitorName = req.body.id;

  pool.query(query, [debitorName], (error, results) => {
    if (error) {
      console.error("Error executing query:", error);
      return res.status(500).json({ error: "Internal Server Error" });
    }

    if (results.affectedRows === 0) {
      return res.status(404).json({
        error: "Not Found: No matching debitor_name found for deletion",
      });
    }

    //console.log("Deleted", results);
    res.json({ message: "Debitor deleted successfully" });
  });
};

const city = async (req, res) => {
  // Use the promisified pool.query function
  const dealerQuery = `
      SELECT DISTINCT city FROM customer
    `;
  pool.query(dealerQuery, (error, results) => {
    if (error) {
      console.error("Error executing query:", error);
      res.status(500).json({ error: "Internal Server Error" });
      return;
    }
    res.status(200).json(results);
  });
};

const designation = async (req, res) => {
  // Use the promisified pool.query function
  const dealerQuery = `
      SELECT DISTINCT designation FROM contact
    `;

  pool.query(dealerQuery, (error, results) => {
    if (error) {
      console.error("Error executing query:", error);
      res.status(500).json({ error: "Internal Server Error" });
      return;
    }

    res.status(200).json(results);
  });
};

const customerentity = async (req, res) => {
  // Use the promisified pool.query function
  const dealerQuery = `
    SELECT DISTINCT customer_entity FROM customer
  `;

  pool.query(dealerQuery, (error, results) => {
    if (error) {
      console.error("Error executing query:", error);
      res.status(500).json({ error: "Internal Server Error" });
      return;
    }

    res.status(200).json(results);
  });
};

const name = async (req, res) => {
  // Use the promisified pool.query function
  const dealerQuery = `
    SELECT DISTINCT name FROM contact
  `;

  pool.query(dealerQuery, (error, results) => {
    if (error) {
      console.error("Error executing query:", error);
      res.status(500).json({ error: "Internal Server Error" });
      return;
    }

    res.status(200).json(results);
  });
};

module.exports = {
  showContact,
  showOneContact,
  addContact,
  editContact,
  deleteContact,
  designation,
  city,
  customerentity,
  name,
  addCustomer,
  editCustomer,
  showCustomer,
  deleteCustomer,
  showOneCustomer,
};
