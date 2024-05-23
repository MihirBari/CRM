const { pool } = require("../database");
const nodemailer = require("nodemailer");
const cron = require("node-cron");
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
    period
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
      SELECT o.id, o.customer_entity, o.name, o.description, o.type, o.period, o.value, o.closure_time, o.status, o.license_from, o.license_to
  FROM 
      opportunity o
  
 
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

      if (period) {
        filterConditions.push(`o.period LIKE '%${period}%'`);
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
        query += ` WHERE ${filterConditions.join(" AND ")}
        `;
      }

      query += ` ORDER BY o.id`;

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
  SELECT o.id, o.customer_entity, o.name, o.description, o.type, o.period, o.value, o.closure_time, o.status, o.license_from, o.license_to, c.phone, c.email
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
    (customer_entity, name,  description, type, value, closure_time, status,period, license_from, license_to)
    VALUES (?, ?, ?, ?, ?, ?, ?,?, ?,?)
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
    period,
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
      period,
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
    period=?,	
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
    req.body.period,
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

const storeAlertInDatabase = (alertDetails) => {
  const query = `
    INSERT INTO alert (alert_entity, alert_description, license_to, alert_type, daysLeft, acknowledge, po_lost, reminder)
    VALUES (?, ?, ?, ?, ?, 'No','No','No')
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
  const { customerEntity, status } = req.query;
  console.log(customerEntity);
  
  let dealerQuery = `
    SELECT id, alert_entity, alert_description, license_to, alert_type, daysLeft, acknowledge, po_lost 
    FROM alert 
    WHERE (acknowledge = "No" AND po_lost = "No" AND reminder = "No") 
       OR (daysLeft = 30 AND acknowledge = "No" AND po_lost = "No")
  `;

  let filterConditions = [];

  if (customerEntity) {
    filterConditions.push(`alert_entity LIKE '%${customerEntity}%'`);
  }

  if (status) {
    filterConditions.push(`alert_type LIKE '%${status}%'`);
  }

  if (filterConditions.length > 0) {
    dealerQuery += ` AND ${filterConditions.join(" AND ")}`;
  }

  pool.query(dealerQuery, (error, results) => {
    if (error) {
      console.error("Error executing query:", error);
      res.status(500).json({ error: "Internal Server Error" });
      return;
    }
    //console.log("Dealer details:", results);
    res.status(200).json({ products: results });
  });
};

const sendPo = async (req, res) => { 
  const { customerEntity, status } = req.query;

  let dealerQuery = `
  SELECT id, alert_entity, alert_description, license_to, alert_type, daysLeft, acknowledge, po_lost FROM alert WHERE acknowledge = "Yes"
  `;

  let filterConditions = [];

  if (customerEntity) {
    filterConditions.push(`alert_entity LIKE '%${customerEntity}%'`);
  }

  if (status) {
    filterConditions.push(`alert_type LIKE '%${status}%'`);
  }

  if (filterConditions.length > 0) {
    dealerQuery += ` AND ${filterConditions.join(" AND ")}`;
  }

  pool.query(dealerQuery, (error, results) => {
    if (error) {
      console.error("Error executing query:", error);
      res.status(500).json({ error: "Internal Server Error" });
      return;
    }
    console.log("Dealer details:", results);
    res.status(200).json({ products: results });
  });
};

const checkOpportunities = () => {
  console.log(`Task started`);

  const query = `
    SELECT id, customer_entity, description, license_from, license_to, type, period
    FROM opportunity
  `;

  pool.query(query, (error, results) => {
    if (error) {
      console.error("Error executing query:", error);
      return;
    }

    results.forEach((opportunity) => {
      const today = new Date();
      const licenseTo = new Date(opportunity.license_to);

      const daysBeforeAlert = [45, 30, 15];
      const formattedLicenseToDate = moment(opportunity.license_to)
        .tz('Asia/Kolkata')
        .format('ddd MMM D YYYY');

      const formattedLicenseFromDate = moment(opportunity.license_from)
        .tz('Asia/Kolkata')
        .format('ddd MMM D YYYY');

      daysBeforeAlert.forEach(days => {
        const alertDate = new Date(licenseTo);
        alertDate.setDate(alertDate.getDate() - days);

        if (alertDate <= today && today <= licenseTo) {
          const daysLeft = Math.ceil((licenseTo - today) / (1000 * 60 * 60 * 24));

          const alertDetails = {
            customer_entity: opportunity.customer_entity,
            description: opportunity.description,
            license_from: formattedLicenseFromDate,
            license_to: formattedLicenseToDate,
            type: opportunity.type,
            daysLeft: daysLeft,
            period: opportunity.period
          };

          // Store alert details in the database
          storeAlertInDatabase(alertDetails);
          //sendEmailAlert(alertDetails)
          console.log(
            `Alert for opportunity ID ${opportunity.id}:`, alertDetails
          );
        }
      });
    });

    console.log(`Task completed`);
  });
};

// Schedule the task to run daily at 1:10 PM IST
cron.schedule('30 11 * * *', () => {
  console.log(`[${moment().tz('Asia/Kolkata').format()}] Scheduled task triggered`);
  checkOpportunities();
},
{
  scheduled: true,
  timezone: "Asia/Kolkata"
}
);

const acknowledge = async (req, res) => {
  const { id } = req.body;
  console.log(id);
  const query = `
      UPDATE alert
      SET 	acknowledge = 'Yes'
      WHERE id = ?
  `;

  pool.query(query, [id], (error, results) => {
    if (error) {
      console.error("Error acknowledging alert:", error);
      res.status(500).send("Server error");
    } else {
      res.send("Alert acknowledged");
    }
  });
};

const reminder = async (req, res) => {
  const { id } = req.body;
  console.log(id);
  const query = `
      UPDATE alert
      SET reminder = 'Yes'
      WHERE id = ?
  `;

  pool.query(query, [id], (error, results) => {
    if (error) {
      console.error("Error acknowledging alert:", error);
      res.status(500).send("Server error");
    } else {
      res.send("Alert acknowledged");
    }
  });
};


const PoLost = async (req, res) => {
  const { id } = req.body;
  console.log(id);
  const query = `
      UPDATE alert
      SET 	po_lost = 'Yes'
      WHERE id = ?
  `;

  pool.query(query, [id], (error, results) => {
    if (error) {
      console.error("Error acknowledging alert:", error);
      res.status(500).send("Server error");
    } else {
      res.send("Alert acknowledged");
    }
  });
};

const customerEntityAlert = async (req, res) => {
  // Use the promisified pool.query function
  const dealerQuery = `
    SELECT distinct alert_entity FROM alert
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
  showOpportunity,
  showOneOpportunity,
  addOpportunity,
  editOpportunity,
  name,
  deleteOpportunity,
  acknowledge,
  sendAlert,
  customerEntityAlert,
  PoLost,
  sendPo,
  reminder
};
