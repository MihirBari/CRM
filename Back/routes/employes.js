// routes/holiday.js
const express = require('express');
const {   addEmployes,
    allEmployes,
    editEmployes,
    viewEmployes,
    name,
    surname,
    deleteEmployes,importExcel } = require('../controller/employes');
const router = express.Router();

const multer = require('multer');
const storage = multer.memoryStorage();
const upload = multer({ storage: storage });

router.post('/addEmployes', addEmployes);
router.get('/allEmployes', allEmployes);
router.put('/editEmployes/:id', editEmployes);
router.get('/viewEmployes/:id', viewEmployes);
router.get('/name', name);
router.get('/surname', surname);
router.delete('/deleteEmployes', deleteEmployes);
router.post("/importExcel",upload.single("file"), importExcel);


module.exports = router;
