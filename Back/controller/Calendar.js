// controller/Calendar.js
const { pool } = require('../database');
const ical = require('ical.js');
const fs = require('fs');

const formatDate = (icalTime) => {
  const date = icalTime.toJSDate(); // Convert to JavaScript Date
  const year = date.getFullYear();
  const month = String(date.getMonth() + 1).padStart(2, '0'); // Months are zero-based
  const day = String(date.getDate()).padStart(2, '0');
  return `${year}-${month}-${day}`;
};

const insertEvent = (date, summary) => {
  return new Promise((resolve, reject) => {
    pool.query('INSERT INTO holiday (date, name) VALUES (?, ?)', [date, summary], (err, results) => {
      if (err) {
        return reject(err);
      }
      resolve(results);
    });
  });
};

const holiday = async (req, res) => {
  try {
    // Read the .ics file
    const fileContent = fs.readFileSync(req.file.path, 'utf-8');

    // Parse the .ics file content
    const jcalData = ical.parse(fileContent);
    const comp = new ical.Component(jcalData);
    const vevents = comp.getAllSubcomponents('vevent');

    // Log the number of events found
    console.log(`Number of events found: ${vevents.length}`);

    // Store the events in the database
    for (const vevent of vevents) {
      const summary = vevent.getFirstPropertyValue('summary');
      const dtstart = formatDate(vevent.getFirstPropertyValue('dtstart')); // Format date to 'YYYY-MM-DD'

      console.log(`Inserting event: ${summary} on ${dtstart}`);

      try {
        const results = await insertEvent(dtstart, summary);
        console.log('Inserted event with ID:', results.insertId);
      } catch (err) {
        console.error('Error executing database query:', err);
      }
    }

    res.status(200).send('File uploaded and data stored successfully.');
  } catch (error) {
    console.error('Error parsing or storing data:', error);
    res.status(500).send('Internal server error.');
  }
};

const getHolidays = (req, res) => {
  pool.query('SELECT * FROM holiday', (err, results) => {
    if (err) {
      console.error('Error fetching holidays:', err);
      res.status(500).send('Internal server error.');
      return;
    }
    res.json(results);
  });
};

const birthday = (req, res) => {
  pool.query('SELECT DOB, name, surname FROM employes', (err, results) => {
    if (err) {
      console.error('Error fetching birthdays:', err);
      res.status(500).send('Internal server error.');
      return;
    }
    //console.log(results)
    res.json(results); // Adjust based on your database driver
  });
}; 

module.exports = {
  holiday,
  getHolidays,
  birthday
};
