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
    LicenseType,
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
        connection.release();
        return;
      }

      let query = `
      SELECT id, customer_entity, name, description, type, period, value, closure_time, status, license_from, license_to, License_type
      FROM opportunity
      `;

      let query2 = `
      SELECT COUNT(customer_entity) as TotalEntity, SUM(value) as TotalValue, COUNT(License_type) as TotalLicenseType, COUNT(type) as TotalType
      FROM opportunity
      `;

      let filterConditions = [];

      if (customerEntities && customerEntities.length > 0) {
        const customerEntitiesList = customerEntities
          .map((entity) => `'${entity}'`)
          .join(",");
        filterConditions.push(`customer_entity IN (${customerEntitiesList})`);
      }

      if (type && Array.isArray(type)) {
        const TypeConditions = type.map(type => `type LIKE '%${type}%'`);
        if (TypeConditions.length > 0) {
          filterConditions.push(`(${TypeConditions.join(" OR ")})`);
        }
      } else if (type) {
        filterConditions.push(`type LIKE '${type}'`);
      }

      if (LicenseType && Array.isArray(LicenseType)) {
        const LicenseTypeConditions = LicenseType.map(LicenseType => `License_type LIKE '${LicenseType}'`);
        if (LicenseTypeConditions.length > 0) {
          filterConditions.push(`(${LicenseTypeConditions.join(" OR ")})`);
        }
      } else if (LicenseType) {
        filterConditions.push(`License_type LIKE '${LicenseType}'`);
      }

      if (value) {
        filterConditions.push(`value LIKE '%${value}%'`);
      }

      if (closureTime) {
        filterConditions.push(`closure_time LIKE '%${closureTime}%'`);
      }

      if (status && Array.isArray(status)) {
        const statusConditions = status.map(status => `status LIKE '%${status}%'`);
        if (statusConditions.length > 0) {
          filterConditions.push(`(${statusConditions.join(" OR ")})`);
        }
      } else if (status) {
        filterConditions.push(`status LIKE '${status}'`);
      }

      if (period) {
        filterConditions.push(`period LIKE '%${period}%'`);
      }

      if (licenseFrom && licenseTo) {
        filterConditions.push(`license_from >= '${licenseFrom}' AND license_to <= '${licenseTo}'`);
      } else if (licenseFrom) {
        filterConditions.push(`license_from >= '${licenseFrom}'`);
      } else if (licenseTo) {
        filterConditions.push(`license_to <= '${licenseTo}'`);
      }

      if (dateFilterType && fromDate && toDate) {
        if (dateFilterType === "equal") {
          filterConditions.push(
            `DATE(license_from) = '${fromDate}' AND DATE(license_to) = '${toDate}'`
          );
        } else if (dateFilterType === "before") {
          filterConditions.push(
            `DATE(license_from) < '${fromDate}' AND DATE(license_to) < '${toDate}'`
          );
        } else if (dateFilterType === "after") {
          filterConditions.push(
            `DATE(license_from) > '${fromDate}' AND DATE(license_to) > '${toDate}'`
          );
        } else if (dateFilterType === "between") {
          filterConditions.push(
            `DATE(license_from) BETWEEN '${fromDate}' AND '${toDate}'`
          );
        }
      }

      if (filterConditions.length > 0) {
        query += ` WHERE ${filterConditions.join(" AND ")}`;
        query2 += ` WHERE ${filterConditions.join(" AND ")}`;
      }

      query += ` ORDER BY id`;

      connection.query(query, (error, results) => {
        if (error) {
          console.error("Error executing first query:", error);
          return connection.rollback(() => {
            res.status(500).json({ error: "Internal Server Error" });
            connection.release();
          });
        }

        connection.query(query2, (error2, results2) => {
          if (error2) {
            console.error("Error executing second query:", error2);
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
            res.status(200).json({ products: results, aggregates: results2[0] });
          });
        });
      });
    });
  });
};


const showOneOpportunity = async (req, res) => {
  const dealerQuery = `
  SELECT 
    o.id, 
    o.customer_entity, 
    o.name, 
    o.description, 
    o.type, 
    o.License_type, 
    o.period, 
    o.value, 
    o.closure_time, 
    o.status, 
    o.license_from, 
    o.license_to, 
    o.pdf,
    c.phone, 
    c.email
FROM 
    opportunity o
LEFT JOIN 
    (
        SELECT 
            customer_entity, 
            name, 
            phone, 
            email
        FROM 
            contact
        GROUP BY 
            customer_entity, 
            name
    ) c 
ON 
    o.customer_entity = c.customer_entity 
    AND o.name = c.name
WHERE 
    o.id = ?
  `;

  pool.query(dealerQuery, [req.params.id], (error, results) => {
    if (error) {
      console.error("Error executing query:", error);
      res.status(500).json({ error: "Internal Server Error" });
      return;
    }
    if (results.length > 0) {
      const opportunity = results[0];
      if (opportunity.pdf) {
        opportunity.pdf = opportunity.pdf.toString('base64');
      }
    }
    res.status(200).json(results);
  });
};

const addOpportunity = async (req, res) => {
  const addDealer = `
    INSERT INTO opportunity
    (customer_entity, name, description, type, License_type, value, closure_time, status, period, license_from, license_to, pdf)
    VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
  `;

  // Extract values from the request body
  const {
    customer_entity,
    name,
    description,
    type,
    License_type,
    value,
    closure_time,
    status,
    period,
    license_from,
    license_to,
    pdf
  } = req.body;



  // Set default values for license_from and license_to if they are not provided
  const licenseFrom = license_from || null;
  const licenseTo = license_to || null;

  // Handle the PDF data if it's provided
  let pdfBuffer = null;
  if (pdf) {
    try {
      pdfBuffer = Buffer.from(pdf.split(',')[1], 'base64');
    } catch (error) {
      console.error("Error decoding PDF data:", error);
      return res.status(400).json({ error: "Invalid PDF data" });
    }
  }

  const values = [
    customer_entity,
    name,
    description,
    type,
    License_type,
    value,
    closure_time,
    status,
    period,
    licenseFrom,
    licenseTo,
    pdfBuffer
  ];

  try {
    await new Promise((resolve, reject) => {
      pool.query(addDealer, values, (error, results) => {
        if (error) {
          console.error("Error executing query:", error);
          reject(error);
        } else {
          resolve();
        }
      });
    });

    res.json({ message: "Opportunity added successfully" });
  } catch (error) {
    console.error("Error:", error);
    res.status(500).json({ error: "Internal Server Error" });
  }
};

const editOpportunity = (req, res) => {
  const { customer_entity, name, description, type, License_type, value, closure_time, status, period, license_from, license_to } = req.body;
  const pdf = req.files && req.files.length > 0 ? req.files[0].buffer : null; 

  const closureTime = closure_time ? new Date(closure_time).toISOString().split('T')[0] : null;
  const LicenseFrom = license_from ? new Date(license_from).toISOString().split('T')[0] : null;
  const LicenseTo = license_to ? new Date(license_to).toISOString().split('T')[0] : null;

  let updateDealer = `
    UPDATE opportunity 
    SET
      customer_entity = ?,
      name = ?,
      description = ?,
      type = ?,
      License_type = ?,
      value = ?,
      closure_time = ?,
      status = ?,
      period = ?,  
      license_from = ?,
      license_to = ?
  `;

  const values = [
    customer_entity,
    name,
    description,
    type,
    License_type,
    value,
    closureTime,
    status,
    period,
    LicenseFrom,
    LicenseTo
  ];

  if (pdf) {
    updateDealer += `, pdf = ?`;
    values.push(pdf);
  }

  updateDealer += ` WHERE id = ?;`;
  values.push(req.params.id);

  pool.query(updateDealer, values, (error, results) => {
    if (error) {
      console.error("Error executing query:", error);
      res.status(500).json({ error: "Internal Server Error" });
      return;
    }

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

    //console.log("Deleted", results);
    res.json({ message: "Opportunity deleted successfully" });
  });
};

const name = async (req, res) => {
  // Use the promisified pool.query function
  const customerEntity = req.body.customer_entity;
  //console.log(customerEntity);
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
  secure: true, 
  auth: {
    user: process.env.SMPT_MAIL,
    pass: process.env.SMPT_PASSWORD,
  },
});

// Function to send email alerts
const sendEmailAlert = (alertDetails) => {
  const mailOptions = {
    from: process.env.SMTP_MAIL,
    to: "madhu.i@techsa.net",
    cc: "himani.g@techsa.net, sanjiv.s@techsa.net",
    subject: "Opportunity Expiry Alert",
    text: `
    An opportunity has arisen for ${alertDetails.customer_entity} to acquire ${alertDetails.description} in ${alertDetails.type} for the ${alertDetails.License_type} license type. These licenses are set to expire in ${alertDetails.daysLeft} days, on ${alertDetails.license_to}.
    `
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
  const checkQuery = `
    SELECT COUNT(*) AS count FROM alert 
    WHERE alert_entity = ? AND license_to = ? AND alert_type = ?
  `;

  pool.query(
    checkQuery,
    [alertDetails.customer_entity, alertDetails.license_to, alertDetails.type],
    (error, results) => {
      if (error) {
        console.error("Error checking for existing alert in database:", error);
        return;
      }

      const count = results[0].count;
      if (count > 0) {
        console.log("Alert already exists in database. Skipping insertion.");
        return;
      }

      const insertQuery = `
        INSERT INTO alert (alert_entity, alert_description, license_to, alert_type, License_type, daysLeft, acknowledge, po_lost, reminder)
        VALUES (?, ?, ?, ?, ?, ?, 'No', 'No', 'No')
      `;

      pool.query(
        insertQuery,
        [
          alertDetails.customer_entity,
          alertDetails.description,
          alertDetails.license_to,
          alertDetails.type,
          alertDetails.License_type,
          alertDetails.daysLeft,
        ],
        (error, results) => {
          if (error) {
            console.error("Error storing/updating alert in database:", error);
          } else {
            console.log("Alert stored/updated in database:", results.insertId);
          }
        }
      );
    }
  );
};

const checkOpportunities = () => {
  console.log(`Task started`);

  const query = `
    SELECT id, customer_entity, description, license_from, license_to, type, License_type, period
    FROM opportunity
  `;

  pool.query(query, (error, results) => {
    if (error) {
      console.error("Error executing query:", error);
      return;
    }

    const today = moment().tz('Asia/Kolkata').startOf('day');

    results.forEach((opportunity) => {
      const licenseTo = moment(opportunity.license_to).tz('Asia/Kolkata').startOf('day');
      const daysLeft = licenseTo.diff(today, 'days');
      const formattedLicenseToDate = licenseTo.format('ddd MMM D YYYY');
      const formattedLicenseFromDate = moment(opportunity.license_from).tz('Asia/Kolkata').format('ddd MMM D YYYY');

      if (daysLeft <= 45 && daysLeft > 0) {
        const alertDetails = {
          customer_entity: opportunity.customer_entity,
          description: opportunity.description,
          license_from: formattedLicenseFromDate,
          license_to: formattedLicenseToDate,
          type: opportunity.type,
          License_type: opportunity.License_type,
          daysLeft: daysLeft,
          period: opportunity.period
        };

        // Store alert details in the database
       // sendEmailAlert(alertDetails)
        storeAlertInDatabase(alertDetails);
        console.log(`Alert stored for opportunity ID ${opportunity.id}:`, alertDetails);
      }
    });

    console.log(`Task completed`);
  });
};

const updateDaysLeftInAlerts = () => {
  console.log('Updating daysLeft for all alerts...');

  const selectQuery = `
    SELECT id, license_to
    FROM alert
    where daysLeft != 0
  `;

  pool.query(selectQuery, (error, results) => {
    if (error) {
      console.error('Error fetching alerts from database:', error);
      return;
    }

    const currentDate = moment().tz('Asia/Kolkata').startOf('day');

    results.forEach(alert => {
      const licenseToDate = moment(alert.license_to, 'ddd MMM D YYYY').tz('Asia/Kolkata').startOf('day');
      if (!licenseToDate.isValid()) {
        console.error(`Invalid date format for alert id ${alert.id}: ${alert.license_to}`);
        return;
      }

      const daysLeft = licenseToDate.diff(currentDate, 'days');

      const updateQuery = `
        UPDATE alert
        SET daysLeft = ?
        WHERE id = ?
      `;

      pool.query(updateQuery, [daysLeft, alert.id], (updateError) => {
        if (updateError) {
          console.error(`Error updating daysLeft for alert id ${alert.id}:`, updateError);
        } else {
          console.log(`Updated daysLeft for alert id ${alert.id}`);
        }
      });
    });
  });
};

const sendAlert = async (req, res) => {
  const { customerEntity, type, licenseType } = req.query;

  let dealerQuery = `
    SELECT id, alert_entity, alert_description, license_to, alert_type, daysLeft, License_type, acknowledge, po_lost, reminder 
    FROM alert 
    WHERE (
      (acknowledge = "No" AND po_lost = "No" AND reminder = "No") 
      OR (daysLeft = 30 AND acknowledge = "No" AND po_lost = "No")
      OR (daysLeft <= 15 AND acknowledge = "No" AND po_lost = "No")
    )
  `;

  let filterConditions = [];

  if (customerEntity && customerEntity.length > 0) {
    const customerEntities = customerEntity.map((entity) => `'${entity}'`).join(",");
    filterConditions.push(`alert_entity IN (${customerEntities})`);
  }

  if (type && type.length > 0) {
    const typeConditions = type.map(t => `alert_type LIKE '%${t}%'`).join(" OR ");
    filterConditions.push(`(${typeConditions})`);
  }

  if (licenseType && licenseType.length > 0) {
    const licenseTypeConditions = licenseType.map(l => `License_type LIKE '%${l}%'`).join(" OR ");
    filterConditions.push(`(${licenseTypeConditions})`);
  }

  if (filterConditions.length > 0) {
    dealerQuery += ` AND (${filterConditions.join(" AND ")})`;
  }

  dealerQuery += ` ORDER BY daysLeft`;

  //console.log("Final Query:", dealerQuery);  // Add logging to debug the final query

  pool.query(dealerQuery, (error, results) => {
    if (error) {
      console.error("Error executing query:", error);
      res.status(500).json({ error: "Internal Server Error" });
      return;
    }

    results.forEach(alert => {
      if (alert.daysLeft === 15) {
        const alertDetails = {
          customer_entity: alert.alert_entity,
          description: alert.alert_description,
          license_to: alert.license_to,
          type: alert.alert_type,
          License_type: alert.License_type,
          daysLeft: alert.daysLeft
        };
        sendEmailAlert(alertDetails);
      }
    });

    res.status(200).json({ products: results });
  });
};

// Schedule the task to run daily at 1:10 PM IST
cron.schedule('30 11 * * *', () => {
  console.log(`[${moment().tz('Asia/Kolkata').format()}] Scheduled task triggered`);
  checkOpportunities();
  updateDaysLeftInAlerts();
}, {
  scheduled: true,
  timezone: "Asia/Kolkata"
});

const sendPo = async (req, res) => { 
  const { customerEntity = [], type = [], licenseType = [] } = req.query;
  let dealerQuery = `
  SELECT id, alert_entity, alert_description, license_to, alert_type, daysLeft, acknowledge, po_lost 
  FROM alert 
  WHERE acknowledge = "Yes"
  `;

  let filterConditions = [];

  if (customerEntity.length > 0) {
    const customerEntities = customerEntity.map((entity) => `'${entity}'`).join(",");
    filterConditions.push(`alert_entity IN (${customerEntities})`);
  }

  if (type.length > 0) {
    const typeConditions = type.map(t => `alert_type LIKE '%${t}%'`).join(" OR ");
    filterConditions.push(`(${typeConditions})`);
  }

  if (licenseType.length > 0) {
    const licenseTypeConditions = licenseType.map(l => `License_type LIKE '%${l}%'`).join(" OR ");
    filterConditions.push(`(${licenseTypeConditions})`);
  }

  if (filterConditions.length > 0) {
    dealerQuery += ` AND (${filterConditions.join(" AND ")})`;
  }

  dealerQuery += ` ORDER BY daysLeft`;

  //console.log("Final Query:", dealerQuery);  // Add logging to debug the final query

  pool.query(dealerQuery, (error, results) => {
    if (error) {
      console.error("Error executing query:", error);
      res.status(500).json({ error: "Internal Server Error" });
      return;
    }

    res.status(200).json({ products: results });
  });
};

const acknowledge = async (req, res) => {
  const { id } = req.body;
  //console.log(id);
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
  //console.log(id);
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
  //console.log(id);
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

const product = (req, res) => {
  const dealerQuery = `SELECT DISTINCT(type) AS name FROM opportunity`;

  pool.query(dealerQuery, (error, results) => {
    if (error) {
      console.error("Error executing query:", error);
      res.status(500).json({ error: "Internal Server Error" });
      return;
    }

    // Map results to include an id field
    const types = results.map((row, index) => ({
      id: index,
      name: row.name
    }));

    res.status(200).json(types);
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
  reminder,
  product
};
