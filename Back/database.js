const express = require('express');
const session = require('express-session');
const MySQLStore = require('express-mysql-session')(session);
const mysql = require('mysql');
require('dotenv').config({
  path: 'config/.env',
});

const app = express();

const pool = mysql.createPool({
  connectionLimit: 10,
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_DATABASE,
  port: process.env.DB_PORT,
  debug: false,
});

pool.getConnection((err, connection) => {
  if (err) {
    console.error('Error connecting to the database:', err);
    if (err.code === 'ETIMEDOUT') {
      console.error('Connection timed out. Please check your database server and network configuration.');
    } else {
      console.error('Error details:', err);
    }
    return;
  }
  console.log('Database connected as id', connection.threadId);
  connection.release();
});


const sessionStore = new MySQLStore({}, pool);

app.use(session({
  key: 'session_cookie_name',
  secret: 'your-secret-key',
  store: sessionStore,
  resave: false,
  saveUninitialized: false,
  cookie: { secure: false } // Set to true if using HTTPS
}));

app.get('/', (req, res) => {
  if (req.session.views) {
    req.session.views++;
    res.send(`<p>Number of views: ${req.session.views}</p>`);
  } else {
    req.session.views = 1;
    res.send('Welcome to the session demo. Refresh!');
  }
});


module.exports = { pool };
