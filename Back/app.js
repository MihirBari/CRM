const express = require('express');
const session = require('express-session');
const cookieParser = require('cookie-parser');
const bodyParser = require('body-parser');
const cors = require('cors');
const { sessionStore } = require('./database');  // Import sessionStore from db.js
const contactRoute = require("./routes/Contact");
const userRoute = require("./routes/user");
const leaveRoute = require("./routes/Leave");
const opportunityRoute = require("./routes/opportunity");
const calendarRoute = require("./routes/Calendar");
const EmployesRoute = require("./routes/employes");
const ErrorHandler = require("./middleware/error");

const app = express();

app.use(express.json());

app.options('*', cors());

app.use(cors({
  origin: process.env.Frontend_url,
  methods: ['GET', 'POST', 'PUT', 'DELETE', 'OPTIONS'],
  allowedHeaders: ['Authorization', 'Content-Type'],
  credentials: true
}));
app.use(cookieParser());
app.use(bodyParser.urlencoded({ extended: true, limit: "50mb" }));
app.use(bodyParser.json({ limit: '50mb' }));

app.use(session({
  key: 'session_cookie_name',
  secret: 'your-secret-key',
  store: sessionStore,
  resave: false,
  saveUninitialized: false,
  cookie: {
    secure: false, // Set to true if using HTTPS
    maxAge: 3 * 24 * 60 * 60 * 1000, // 3 days
  },
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

app.use("/api/user", userRoute);
app.use("/api/Contact", contactRoute);
app.use("/api/Leave", leaveRoute);
app.use("/api/Opportunity", opportunityRoute);
app.use("/api/Holiday", calendarRoute);
app.use("/api/Employes", EmployesRoute);

// Error handling middleware
app.use(ErrorHandler);

module.exports = app;
