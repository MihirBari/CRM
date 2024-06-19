const { pool } = require("../database");
const nodemailer = require("nodemailer");

const showApplicationLeave = (req, res) => {
  const { fromDate, status, toDate, dateFilterType } = req.query;
  const { id, role } = req.user;
  //console.log(req.user);
  let query = `
        SELECT la.id, la.name,la.surname,la.status, la.fromDate, la.toDate, la.duration, 
        la.days, la.description, la.history,
        la.created_at, la.update_at
        FROM leaveapplication la
        JOIN user u ON u.name = la.name
        `;

  if (role === "admin") {
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

  // if (status) {
  //   filterConditions.push(`status LIKE '%${status}%'`);
  // }

  if (status && Array.isArray(status)) {
    const statusConditions = 	status.map(status => `status LIKE '%${status}%'`);
    if (statusConditions.length > 0) {
      filterConditions.push(`(${statusConditions.join(" OR ")})`);
    }
  } else if (status) {
    filterConditions.push(`status LIKE '${status}'`);
  }

  // if (type && Array.isArray(type)) {
  //   const TypeConditions = type.map(type => `type LIKE '%${type}%'`);
  //   if (TypeConditions.length > 0) {
  //     filterConditions.push(`(${TypeConditions.join(" OR ")})`);
  //   }
  // } else if (type) {
  //   filterConditions.push(`type LIKE '${type}'`);
  // }

  if (dateFilterType && fromDate && toDate) {
    if (dateFilterType === "equal") {
      filterConditions.push(
        `fromDate = '${fromDate}' AND toDate = '${toDate}'`
      );
    } else if (dateFilterType === "before") {
      filterConditions.push(
        `fromDate < '${fromDate}' AND toDate < '${toDate}'`
      );
    } else if (dateFilterType === "after") {
      filterConditions.push(
        `fromDate > '${fromDate}' AND toDate > '${toDate}'`
      );
    } else if (dateFilterType === "between") {
      filterConditions.push(`fromDate BETWEEN '${fromDate}' AND '${toDate}'`);
    }
  }

  if (filterConditions.length > 0) {
    query += ` AND ${filterConditions.join(" AND ")}`;
  }

  query += ` ORDER BY id DESC`;

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
          //console.log(results)
          // Release connection back to the pool
          connection.release();
        });
      });
    });
  });
};

const showOneApplicationLeave = async (req, res) => {
  const dealerQuery = `
  SELECT id, name,surname, status, fromDate, toDate, duration, 
  days, description, history, created_at
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
        (name, surname, status, fromDate, toDate, duration, days, description,
        history, createdBy, created_at)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, NOW())
      `;

      // Prepare values for the insert query
      let values = [
        req.body.name,
        req.body.surname,
        req.body.status,
        req.body.fromDate || null, // Using null if fromDate is null or empty string
        req.body.toDate || null,  
        req.body.duration,
        req.body.days,
        req.body.description,
        req.body.history,
        req.body.name,
      ];

      // Execute the insert query
      connection.query(addDealer, values, (error, results) => {
        if (error) {
          console.error("Error executing query:", error);
          return connection.rollback(() => {
            connection.release();
            res.status(500).json({ error: "Internal Server Error" });
          });
        }

        console.log("Leave application added successfully:");

        const addDealer2 = `
          SELECT la.*, uu.email as sender
          FROM leaveapplication la
          JOIN user AS uu ON uu.name = la.name
          WHERE la.id = ?
        `;

        // Execute the second query to fetch inserted data
        connection.query(addDealer2, [results.insertId], (error, rows) => {
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

          console.log("Fetched user email:", rows[0].sender);

          // Format the dates if they exist
          const fromDate = rows[0].fromDate ? new Date(rows[0].fromDate).toLocaleDateString("en-GB") : null;
          const toDate = rows[0].toDate ? new Date(rows[0].toDate).toLocaleDateString("en-GB") : null;

          // Nodemailer configuration
          const transporter = nodemailer.createTransport({
            host: process.env.SMPT_HOST,
            port: process.env.SMPT_PORT,
            secure: true, // Use true for 465, false for other ports
            auth: {
              user: process.env.SMPT_MAIL,
              pass: process.env.SMPT_PASSWORD,
            },
          });

          const mailOptions = {
            from: `"TechSa CRM" <${process.env.SMPT_MAIL}>`,
            to: `${process.env.SMPT_MAIL}`,
            cc: "mihir.b@techsa.net",
            //replyTo: `${rows[0].sender}`, // Setting the actual sender's email in replyTo
            subject: `Leave Application Confirmation`,
            text: `Hi Sir,

        I, ${rows[0].name} ${rows[0].surname}, am writing to request a leave from ${fromDate || 'N/A'} to ${toDate || 'N/A'} for ${rows[0].days}. ${rows[0].description}

Regards,
${rows[0].name} ${rows[0].surname}
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
  const checkStatusQuery = `
    SELECT la.name, la.surname, u.email, la.status, la.history, la.fromDate, la.toDate, la.days, la.description 
    FROM leaveapplication la
    JOIN user AS u ON u.name = la.name
    WHERE la.id = ?;
  `;

  pool.getConnection((err, connection) => {
    if (err) {
      console.error("Error connecting to database:", err);
      return res.status(500).json({ error: "Internal Server Error" });
    }

    connection.query(checkStatusQuery, [req.params.id], (error, rows) => {
      if (error) {
        console.error("Error executing query:", error);
        connection.release();
        return res.status(500).json({ error: "Internal Server Error" });
      }

      if (!rows || rows.length === 0) {
        console.error("No rows returned");
        connection.release();
        return res.status(404).json({ error: "Not Found" });
      }

      const currentStatus = rows[0].status;
      const userEmail = rows[0].email;
      const userName = rows[0].name;
      const userSurname = rows[0].surname;
      let comment = rows[0].history;

      const fromDateChanged = req.body.fromDate !== rows[0].fromDate;
      const toDateChanged = req.body.toDate !== rows[0].toDate;

      if (fromDateChanged || toDateChanged) {
        comment = `${comment || ''}`;
      }

      const updateDatabase = () => {
        const updateDealer = `
          UPDATE leaveapplication 
          SET
          name = ?,
          surname = ?,
          status = ?,
          fromDate = ?,
          toDate = ?, 
          duration = ?,
          days = ?,
          description = ?,
          history = ?,  
          update_at = NOW()
          WHERE id = ?;
        `;

        const values = [
          req.body.name,
          req.body.surname,
          req.body.status,
          req.body.fromDate || null, // Set to null if undefined or empty
          req.body.toDate || null,  
          req.body.duration,
          req.body.days,
          req.body.description,
          req.body.history,
          req.params.id,
        ];

        connection.query(updateDealer, values, (error, results) => {
          if (error) {
            console.error("Error executing update query:", error);
            connection.release();
            return res.status(500).json({ error: "Internal Server Error" });
          }

          //console.log("Updated leave application:", results);
          connection.release();
          res.json(results);
        });
      };

      if ((currentStatus === 'approved' || currentStatus === 'rejected') && (fromDateChanged || toDateChanged)) {
        req.body.status = 'request';

        const mailOptions = {
          from: `"Techsa CRM" <${process.env.SMPT_MAIL}>`,
          to: `${process.env.SMPT_MAIL}`,
          cc: "mihir.b@techsa.net",
          subject: `Leave Application Confirmation`,
          text: `Hi Sir,

I, ${userName} ${userSurname}, am writing to request a leave from ${req.body.fromDate} to ${req.body.toDate} for ${req.body.days} days. ${rows[0].description}

Regards,
${userName} ${userSurname}`,
        };

        const transporter = nodemailer.createTransport({
          host: process.env.SMPT_HOST,
          port: process.env.SMPT_PORT,
          secure: true, // Use true for 465, false for other ports
          auth: {
            user: process.env.SMPT_MAIL,
            pass: process.env.SMPT_PASSWORD,
          },
        });

        transporter.sendMail(mailOptions, (error, info) => {
          if (error) {
            console.error("Error sending email:", error);
            connection.release();
            return res.status(500).json({ error: "Internal Server Error" });
          }

          console.log("Email sent:", info.response);
          updateDatabase();
        });
      } else if (req.body.status === "approved" || req.body.status === "rejected") {
        const mailOptions = {
          from: `<${process.env.SMPT_MAIL}>`,
          to: userEmail,
          subject: "Leave Application Status Update",
          text: `Hi ${userName} ${userSurname},\n\nYour leave application has been ${req.body.status}.
          ${comment}

          \n\nRegards,\nTechsa CRM`,
        };

        const transporter = nodemailer.createTransport({
          host: process.env.SMPT_HOST,
          port: process.env.SMPT_PORT,
          secure: true, // Use true for 465, false for other ports
          auth: {
            user: process.env.SMPT_MAIL,
            pass: process.env.SMPT_PASSWORD,
          },
        });

        transporter.sendMail(mailOptions, (error, info) => {
          if (error) {
            console.error("Error sending email:", error);
            connection.release();
            return res.status(500).json({ error: "Internal Server Error" });
          }

          console.log("Email sent:", info.response);
          updateDatabase();
        });
      } else {
        updateDatabase();
      }
    });
  });
};


module.exports = {
  showApplicationLeave,
  addApplicationLeave,
  editApplicationAdmin,
  showOneApplicationLeave,
};
