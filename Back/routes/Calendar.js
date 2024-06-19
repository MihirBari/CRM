// routes/holiday.js
const express = require('express');
const { holiday, getHolidays,birthday } = require('../controller/Calendar');
const multer = require('multer');
const router = express.Router();

const upload = multer({ dest: 'uploads/' });
router.post('/holiday', upload.single('file'), holiday);
router.get('/holidays', getHolidays);
router.get('/birthday', birthday);

module.exports = router;