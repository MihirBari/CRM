//If not working peoperly

// const storeAlertInDatabase = (alertDetails) => {
  
//     //console.log(alertDetails)
//       const query = `
//         INSERT INTO alert (alert_entity, alert_description, license_to, alert_type, License_type, daysLeft, acknowledge, po_lost, reminder)
//         VALUES (?, ?, ?, ?, ?, ?, 'No', 'No', 'No')
//         `
    
//       //console.log("Days Left:", alertDetails.daysLeft);
//       pool.query(
//         query,
//         [
//           alertDetails.customer_entity,
//           alertDetails.description,
//           alertDetails.license_to,
//           alertDetails.type,
//           alertDetails.License_type,
//           alertDetails.daysLeft,
//         ],
//         (error, results) => {
//           if (error) {
//             console.error("Error storing/updating alert in database:", error);
//           } else {
//             console.log("Alert stored/updated in database:", results.insertId);
//           }
//         }
//       );
//     };
    
//     const checkOpportunities = () => {
//       console.log(`Task started`);
    
//       const query = `
//         SELECT id, customer_entity, description, license_from, license_to, type, License_type, period
//         FROM opportunity
//       `;
    
//       pool.query(query, (error, results) => {
//         if (error) {
//           console.error("Error executing query:", error);
//           return;
//         }
    
//         results.forEach((opportunity) => {
//           const today = moment().tz('Asia/Kolkata').startOf('day');
//           const licenseTo = moment(opportunity.license_to).tz('Asia/Kolkata').startOf('day');
    
//           const daysBeforeAlert = [45, 30, 15];
//           const formattedLicenseToDate = licenseTo.format('ddd MMM D YYYY');
//           const formattedLicenseFromDate = moment(opportunity.license_from).tz('Asia/Kolkata').format('ddd MMM D YYYY');
    
//           daysBeforeAlert.forEach(days => {
//             const alertDate = moment(licenseTo).subtract(days, 'days');
    
//             if (alertDate.isSame(today, 'day')) {
//               const daysLeft = licenseTo.diff(today, 'days');
    
//               if (daysLeft === 45 || daysLeft === 30 || daysLeft === 15) {
//                 const alertDetails = {
//                   customer_entity: opportunity.customer_entity,
//                   description: opportunity.description,
//                   license_from: formattedLicenseFromDate,
//                   license_to: formattedLicenseToDate,
//                   type: opportunity.type,
//                   License_type: opportunity.License_type,
//                   daysLeft: daysLeft,
//                   period: opportunity.period
//                 };
    
//                 // Store alert details in the database
//                 storeAlertInDatabase(alertDetails);
//                 //sendEmailAlert(alertDetails);
//                 console.log(`Alert stored for opportunity ID ${opportunity.id}:`, alertDetails);
//               }
//             }
//           });
//         });
    
//         console.log(`Task completed`);
//       });
//     };