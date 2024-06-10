const { pool } = require("../database");
const nodemailer = require("nodemailer");

const showApplicationLeave = (req, res) => {
    const {
        fromDate,
        type,
        status,
        toDate,
        assignedTo,
        dateFilterType
    } = req.query;
    const { id, role } = req.user;
console.log(req.user)
    let query = `
        SELECT la.id, la.name,la.status, la.fromDate, la.toDate,la.type, la.duration, 
        la.days, la.description, la.history, la.assignedTo,
        la.created_at, la.update_at
        FROM leaveapplication la
        JOIN user u ON u.name = la.name
        `;

        if (role === 'admin') {
          // If the user is an admin, fetch all leave applications
          query += `
              WHERE 1=1
          `;
      } else {
          // If the user is not an admin, fetch only their leave applications
          query += `
              WHERE u.id = ?
          `;
      }

    let filterConditions = [];

    if (status) {
        filterConditions.push(`status LIKE '%${status}%'`);
    }

    if (type) {
        filterConditions.push(`type LIKE '%${type}%'`);
    }

    if (assignedTo) {
        filterConditions.push(`assignedTo LIKE '%${assignedTo}%'`);
    }

    if (dateFilterType && fromDate && toDate) {
        if (dateFilterType === "equal") {
            filterConditions.push(`fromDate = '${fromDate}' AND toDate = '${toDate}'`);
        } else if (dateFilterType === "before") {
            filterConditions.push(`fromDate < '${fromDate}' AND toDate < '${toDate}'`);
        } else if (dateFilterType === "after") {
            filterConditions.push(`fromDate > '${fromDate}' AND toDate > '${toDate}'`);
        } else if (dateFilterType === "between") {
            filterConditions.push(`fromDate BETWEEN '${fromDate}' AND '${toDate}'`);
        }
    }

    if (filterConditions.length > 0) {
        query += ` AND ${filterConditions.join(" AND ")}`;
    }

    // Start a transaction
    pool.getConnection((err, connection) => {
        if (err) {
            console.error("Error getting connection from pool:", err);
            res.status(500).json({ error: "Internal Server Error" });
            return;
        }

        connection.beginTransaction((err) => {
            if (err) {
                console.error("Error starting transaction:", err);
                res.status(500).json({ error: "Internal Server Error" });
                return;
            }

            // Run the query with user ID and role
            connection.query(query, [id, role], (error, results) => {
                if (error) {
                    return connection.rollback(() => {
                        console.error("Error executing query:", error);
                        res.status(500).json({ error: "Internal Server Error" });
                        connection.release();
                    });
                }

                // Commit the transaction if the query is successful
                connection.commit((err) => {
                    if (err) {
                        return connection.rollback(() => {
                            console.error("Error committing transaction:", err);
                            res.status(500).json({ error: "Internal Server Error" });
                            connection.release();
                        });
                    }

                    res.status(200).json({ dealers: results });
                    console.log(results)
                    // Release connection back to the pool
                    connection.release();
                });
            });
        });
    });
};

const showOneApplicationLeave = async (req, res) => {
  
  const dealerQuery = `
  SELECT id, name, status, fromDate, toDate, type, duration, 
  days, description, history, assignedTo, created_at
  FROM leaveapplication
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

const addApplicationLeave = (req, res) => {

  // Begin a SQL transaction
  pool.getConnection((err, connection) => {
    if (err) {
      console.error("Error connecting to database:", err);
      return res.status(500).json({ error: "Internal Server Error" });
    }

    connection.beginTransaction((err) => {
      if (err) {
        console.error("Error beginning transaction:", err);
        connection.release();
        return res.status(500).json({ error: "Internal Server Error" });
      }


      const addDealer = `
    INSERT INTO leaveapplication
    (name, status, fromDate, toDate, type, duration, days, description,
    history, assignedTo, createdBy, created_at)
    VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, NOW())
`;

const value = [
    req.body.name,
    req.body.status,
    req.body.fromDate,
    req.body.toDate,
    req.body.type,
    req.body.duration,
    req.body.days,
    req.body.description,
    req.body.history,
    req.body.assignedTo,
    req.body.name 
];


      // Execute the first query
      connection.query(addDealer, value, (error, results) => {
        if (error) {
          console.error("Error executing query:", error);
          return connection.rollback(() => {
            connection.release();
            res.status(500).json({ error: "Internal Server Error" });
          });
        }

        console.log("Leave application added successfully:");

        const addDealer2 = `
        SELECT la.*, u.email , uu.email as sender
        FROM leaveapplication la
        JOIN user AS u ON u.name = la.assignedTo
        JOIN user AS uu ON uu.name = la.name
        WHERE la.id = ?
        `;

       
        // Execute the second query
        connection.query(addDealer2, [results.insertId], (error, rows) => {
          console.log(rows)
          if (error) {
            console.error("Error executing second query:", error);
            return connection.rollback(() => {
              connection.release();
              res.status(500).json({ error: "Internal Server Error" });
            });
          }

          // Check if rows array is empty
          if (!rows || rows.length === 0) {
            console.error("No rows returned from second query");
            return connection.rollback(() => {
              connection.release();
              res.status(500).json({ error: "Internal Server Error" });
            });
          }

          console.log("Fetched user email:", rows[0].email);

          // Nodemailer configuration
          const transporter = nodemailer.createTransport({
            host: process.env.SMPT_HOST,
            port: process.env.SMPT_PORT,
            service: process.env.SMPT_SERVICE,
            auth: {
              user: process.env.SMPT_MAIL,
              pass: process.env.SMPT_PASSWORD,
            },
          });

          const mailOptions = {
            from: `${rows[0].sender}`,
            to: rows[0].email,
            subject:`Leave Application Confirmation`,
            text: `Hi Sir,
            
            I am writing this mail to ask for ${rows[0].type} from ${rows[0].fromDate} to ${rows[0].toDate}.
            
            
            Regards,
            ${rows[0].name}
            `,
          };

          // Sending email
          transporter.sendMail(mailOptions, (error, info) => {
            if (error) {
              console.error("Error sending email:", error);
              return connection.rollback(() => {
                connection.release();
                res.status(500).json({ error: "Internal Server Error" });
              });
            }
            console.log("Email sent:", info.response);

            // Commit the transaction if everything is successful
            connection.commit((err) => {
              if (err) {
                console.error("Error committing transaction:", err);
                return connection.rollback(() => {
                  connection.release();
                  res.status(500).json({ error: "Internal Server Error" });
                });
              }

              // Release the connection
              connection.release();
              res.json(results);
            });
          });
        });
      });
    });
  });
};

const editApplicationAdmin = (req, res) => {
  const updateDealer = `
    UPDATE leaveapplication 
    SET
    name = ?,
    status = ?,
    fromDate = ?,
    toDate = ?, 
    type = ?,
    duration = ?,
    days = ?,
    description= ?,
    history =?,	
    update_at = NOW()
    
    WHERE
    id = ? ;
  `;

  const values = [
    req.body.name,
    req.body.status,
    req.body.fromDate,
    req.body.toDate,
    req.body.type,
    req.body.duration,
    req.body.days,
    req.body.description,
    req.body.history,
    req.params.id,
  ];

  pool.query(updateDealer, values, (error, results) => {
    if (error) {
      console.error("Error executing query:", error);
      return res.status(500).json({ error: "Internal Server Error" });
    }

    console.log("Updated dealer:", results);

    // Check if status is 'approved'
    if (req.body.la && (req.body.la.status === "approved" || req.body.la.status === "rejected")) {
      const updateDealer2 = `
        SELECT la.name, u.email 
        FROM leaveapplication la
        JOIN user AS u ON u.name = la.name
        WHERE (la.status = 'approved' OR la.status = 'rejected') AND la.id = ?;
      `;

      pool.query(updateDealer2, [req.params.id], (error, rows) => {
        if (error) {
          console.error("Error executing second query:", error);
          return res.status(500).json({ error: "Internal Server Error" });
        }

        console.log("Fetched user email:", rows[0].email);

        // Nodemailer configuration
        const transporter = nodemailer.createTransport({
          host: process.env.SMPT_HOST, 
          port: process.env.SMPT_PORT,
          service: process.env.SMPT_SERVICE,
          auth: {
            user: process.env.SMPT_MAIL,
            pass: process.env.SMPT_PASSWORD,
          },
        });

        const mailOptions = {
          from: "barimihir23@gmail.com",
          to: rows[0].email,
          subject: "Leave Application Approval",
          text: "Your leave application has been approved.",
        };

        // Sending email
        transporter.sendMail(mailOptions, (error, info) => {
          if (error) {
            console.error("Error sending email:", error);
            return res.status(500).json({ error: "Internal Server Error" });
          }
          console.log("Email sent:", info.response);

          // Send response
          res.json(results);
        });
      });
    } else {
      // Send response if status is not 'approved'
      res.json(results);
    }
  });
};

module.exports = {
  showApplicationLeave,
  addApplicationLeave,
  editApplicationAdmin,
  showOneApplicationLeave,
};