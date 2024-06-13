// routes/holiday.js
const express = require('express');
const {   addEmployes,
    allEmployes,
    editEmployes,
    viewEmployes,
    name,
    surname,
    deleteEmployes } = require('../controller/employes');
const router = express.Router();

router.post('/addEmployes', addEmployes);
router.get('/allEmployes', allEmployes);
router.put('/editEmployes/:id', editEmployes);
router.get('/viewEmployes/:id', viewEmployes);
router.get('/name', name);
router.get('/surname', surname);
router.delete('/deleteEmployes', deleteEmployes);



module.exports = router;
