const { pool } = require("../database");
const nodemailer = require("nodemailer");
const cron = require("node-cron");
const WebSocket = require("ws");
const moment = require("moment-timezone");

const showOpportunity = (req, res) => {
  const {
    customerEntities,
    type,
    value,
    closureTime,
    status,
    licenseFrom,
    licenseTo,
    dateFilterType,
    fromDate,
    toDate,
  } = req.query;

  pool.getConnection((err, connection) => {
    if (err) {
      console.error("Error getting database connection:", err);
      res.status(500).json({ error: "Internal Server Error" });
      return;
    }

    connection.beginTransaction((err) => {
      if (err) {
        console.error("Error beginning transaction:", err);
        res.status(500).json({ error: "Internal Server Error" });
        return connection.release();
      }

      let query = `
      SELECT o.id, o.customer_entity, o.name, o.description, o.type, o.value, o.closure_time, o.status, o.license_from, o.license_to, c.phone, c.email
  FROM 
      opportunity o
  LEFT JOIN 
      (
          SELECT customer_entity, name, phone, email
          FROM 
              contact
          GROUP BY 
              customer_entity, 
              name
      ) c ON o.customer_entity = c.customer_entity AND o.name = c.name
      ORDER by  o.id
      `;

      let filterConditions = [];

      if (customerEntities && customerEntities.length > 0) {
        const customerEntitiesList = customerEntities
          .map((entity) => `'${entity}'`)
          .join(",");
        filterConditions.push(`o.customer_entity IN (${customerEntitiesList})`);
      }

      if (type) {
        filterConditions.push(`o.type LIKE '%${type}%'`);
      }

      if (value) {
        filterConditions.push(`o.value LIKE '%${value}%'`);
      }

      if (closureTime) {
        filterConditions.push(`o.closure_time LIKE '%${closureTime}%'`);
      }

      if (status) {
        filterConditions.push(`o.status LIKE '%${status}%'`);
      }

      if (licenseFrom) {
        filterConditions.push(`o.license_from = '${licenseFrom}'`);
      }

      if (licenseTo) {
        filterConditions.push(`o.license_to = '${licenseTo}'`);
      }

      if (dateFilterType && fromDate && toDate) {
        if (dateFilterType === "equal") {
          filterConditions.push(
            `DATE(o.license_from) = '${fromDate}' AND DATE(o.license_to) = '${toDate}'`
          );
        } else if (dateFilterType === "before") {
          filterConditions.push(
            `DATE(o.license_from) < '${fromDate}' AND DATE(o.license_to) < '${toDate}'`
          );
        } else if (dateFilterType === "after") {
          filterConditions.push(
            `DATE(o.license_from) > '${fromDate}' AND DATE(o.license_to) > '${toDate}'`
          );
        } else if (dateFilterType === "between") {
          filterConditions.push(
            `DATE(o.license_from) BETWEEN '${fromDate}' AND '${toDate}'`
          );
        }
      }

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
      });
    });
  });
};

const showOneOpportunity = async (req, res) => {
  const dealerQuery = `
  SELECT customer_entity, name, description, type, value, closure_time, status, license_from, license_to
  FROM opportunity
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

const addOpportunity = async (req, res) => {
  const addDealer = `
    INSERT INTO opportunity
    (customer_entity, name,  description, type, value, closure_time, status, license_from, license_to)
    VALUES (?, ?, ?, ?, ?, ?, ?, ?,?)
    `;

  // Extract common values from the request body
  const {
    customer_entity,
    name,
    description,
    type,
    value,
    closure_time,
    status,
    license_from,
    license_to,
  } = req.body;

  try {
    // Iterate over each contact and insert into the database

    const values = [
      customer_entity,
      name,
      description,
      type,
      value,
      closure_time,
      status,
      license_from,
      license_to,
    ];

    await new Promise((resolve, reject) => {
      pool.query(addDealer, values, (error, results) => {
        if (error) {
          console.error("Error executing query:", error);
          reject(error);
        } else {
          console.log("Contact added successfully:", results);
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

const editOpportunity = (req, res) => {
  const updateDealer = `
    UPDATE opportunity 
    SET
    customer_entity = ?,
    name = ?,
    description = ?,
    type = ?,
    value = ?,
    closure_time= ?,
    status =?,	
    license_from = ?,
    license_to = ?
    WHERE
    id = ? ;
    `;

  const values = [
    req.body.customer_entity,
    req.body.name,
    req.body.description,
    req.body.type,
    req.body.value,
    req.body.closure_time,
    req.body.status,
    req.body.license_from,
    req.body.license_to,
    req.params.id,
  ];

  pool.query(updateDealer, values, (error, results) => {
    if (error) {
      console.error("Error executing query:", error);
      res.status(500).json({ error: "Internal Server Error" });
      return;
    }

    console.log("Updated dealer:", results);
    res.json(results);
  });
};

const deleteOpportunity = (req, res) => {
  const query = "DELETE FROM opportunity WHERE id = ?";
  const opportunityId = req.body.id; // Use the correct variable name

  pool.query(query, [opportunityId], (error, results) => {
    if (error) {
      console.error("Error executing query:", error);
      return res.status(500).json({ error: "Internal Server Error" });
    }

    if (results.affectedRows === 0) {
      return res.status(404).json({
        error: "Not Found: No matching opportunity found for deletion",
      });
    }

    console.log("Deleted", results);
    res.json({ message: "Opportunity deleted successfully" });
  });
};

const name = async (req, res) => {
  // Use the promisified pool.query function
  const customerEntity = req.body.customer_entity;
  console.log(customerEntity);
  const dealerQuery = `
      SELECT  name FROM contact
      where customer_entity = ?
    `;

  pool.query(dealerQuery, [customerEntity], (error, results) => {
    if (error) {
      console.error("Error executing query:", error);
      res.status(500).json({ error: "Internal Server Error" });
      return;
    }

    res.status(200).json(results);
  });
};

const transporter = nodemailer.createTransport({
  host: process.env.SMPT_HOST,
  port: process.env.SMPT_PORT,
  service: process.env.SMPT_SERVICE,
  auth: {
    user: process.env.SMPT_MAIL,
    pass: process.env.SMPT_PASSWORD,
  },
});

// Set up the WebSocket server
const wss = new WebSocket.Server({ port: 8081 });

wss.on("connection", (ws) => {
  console.log("Client connected");

  // Send all unacknowledged alerts to the newly connected client
  pool.query(
    'SELECT alert_entity, alert_description, alert_type, license_to, daysLeft FROM alert WHERE acknowledge = "No"',
    (error, results) => {
      if (error) {
        console.error("Error fetching alerts from database:", error);
        return;
      }
      results.forEach((alert) => {
        ws.send(alert.alertDetails);
      });
    }
  );

  ws.on("close", () => {
    console.log("Client disconnected");
  });
});

// Function to send email alerts
const sendEmailAlert = (alertDetails) => {
  const mailOptions = {
    from: process.env.EMAIL,
    to: "mihir.b@techsa.net",
    cc: "kajal.u@techsa.net",
    subject: "Opportunity Expiry Alert",
    text: alertMessage,
  };

  transporter.sendMail(mailOptions, (error, info) => {
    if (error) {
      console.error("Error sending email:", error);
    } else {
      console.log("Email sent:", info.response);
    }
  });
};

// Function to send WebSocket alerts
const sendWebSocketAlert = (alertDetails) => {
  wss.clients.forEach((client) => {
    if (client.readyState === WebSocket.OPEN) {
      client.send(alertDetails);
    }
  });
};

const storeAlertInDatabase = (alertDetails) => {
  const query = `
    INSERT INTO alert (alert_entity, alert_description, license_to, alert_type, daysLeft, acknowledge)
    VALUES (?, ?, ?, ?, ?, 'No')
  `;

  pool.query(query, [
    alertDetails.customer_entity,
    alertDetails.description,
    alertDetails.license_to,
    alertDetails.type,
    alertDetails.daysLeft
  ], (error, results) => {
    if (error) {
      console.error("Error storing alert in database:", error);
    } else {
      console.log("Alert stored in database:", results.insertId);
    }
  });
};


const sendAlert = async (req, res) => {
  const dealerQuery = `
  SELECT alert_entity, alert_description, license_to, alert_type, daysLeft, acknowledge FROM alert WHERE acknowledge = "No"
  `;

  pool.query(dealerQuery, (error, results) => {
    if (error) {
      console.error("Error executing query:", error);
      res.status(500).json({ error: "Internal Server Error" });
      return;
    }
    console.log("Dealer details:", results);
    res.status(200).json(results);
  });
};


const checkOpportunities = () => {
  console.log(`Task started`);

  const query = `
    SELECT id, customer_entity, description, license_from, license_to, type
    FROM opportunity
  `;

  pool.query(query, (error, results) => {
    if (error) {
      console.error("Error executing query:", error);
      return;
    }

    results.forEach((opportunity) => {
      const today = new Date();
      const licenseFrom = new Date(opportunity.license_from);
      const licenseTo = new Date(opportunity.license_to);

      // Iterate through each anniversary date
      for (let year = licenseFrom.getFullYear(); year <= licenseTo.getFullYear(); year++) {
        const anniversaryDate = new Date(licenseFrom);
        anniversaryDate.setFullYear(year);

        // Calculate the alert date (45 days before anniversary date)
        const alertDate = new Date(anniversaryDate);
        alertDate.setDate(alertDate.getDate() - 45);

        if (alertDate <= today && today <= anniversaryDate) {
          const daysLeft = Math.ceil((anniversaryDate - today) / (1000 * 60 * 60 * 24));

          const formattedLicenseToDate = moment(opportunity.license_to)
            .tz('Asia/Kolkata')
            .format('ddd MMM D YYYY');

            const formattedLicenseFromDate = moment(opportunity.license_from)
            .tz('Asia/Kolkata')
            .format('ddd MMM D YYYY');

          const alertDetails = {
            customer_entity: opportunity.customer_entity,
            description: opportunity.description,
            license_from: formattedLicenseFromDate,
            license_to: formattedLicenseToDate,
            type: opportunity.type,
            daysLeft: daysLeft
          };

          // Send WebSocket alert
          sendWebSocketAlert(alertDetails);

          // Store alert details in the database
          storeAlertInDatabase(alertDetails);

          console.log(
            `Alert for opportunity ID ${opportunity.id}:`, alertDetails
          );
        }
      }
    });

    console.log(`Task completed`);
  });
};

// Schedule the task to run daily at 1:10 PM IST
cron.schedule('39 18 * * *', () => {
  console.log(`[${moment().tz('Asia/Kolkata').format()}] Scheduled task triggered`);
  checkOpportunities();
},
{
  scheduled: true,
  timezone: "Asia/Kolkata"
}
);

const acknowledge = async (req, res) => {
  const { alertMessage } = req.body;
  console.log(alertMessage);
  const query = `
      UPDATE alert
      SET acknowledge = 'Yes'
      WHERE alertMessage = ?
  `;

  pool.query(query, [alertMessage], (error, results) => {
    if (error) {
      console.error("Error acknowledging alert:", error);
      res.status(500).send("Server error");
    } else {
      res.send("Alert acknowledged");
    }
  });
};

module.exports = {
  showOpportunity,
  showOneOpportunity,
  addOpportunity,
  editOpportunity,
  name,
  deleteOpportunity,
  acknowledge,
  sendAlert
};
