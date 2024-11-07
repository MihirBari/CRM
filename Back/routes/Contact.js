const express = require("express");
const {   showContact,
    showOneContact,
    showOneCustomer,
    addContact,
    editContact,
    city,
    designation,
    customerentity,
    name,
    addCustomer,
  editCustomer,
  showCustomer,
    deleteContact,
    deleteCustomer,
    showCustomerOpportunity} = require("../controller/Contact");
const { authenticateToken } = require("../utils/authenticateToken ");
const router = express.Router();


router.get("/showContact/:customer_entity" ,authenticateToken, showContact);
router.get("/showCustomer" ,authenticateToken, showCustomer);
router.get("/showOneContact/:id",authenticateToken, showOneContact);
router.get("/showOneCustomer/:id",authenticateToken, showOneCustomer);
router.post("/addContact",authenticateToken, addContact);
router.post("/addCustomer",authenticateToken, addCustomer);
router.put("/editContact/:id",authenticateToken, editContact);
router.put("/editCustomer/:id",authenticateToken, editCustomer);
router.delete("/deleteContact",authenticateToken, deleteContact);
router.delete("/deleteCustomer",authenticateToken, deleteCustomer);
router.get("/city",authenticateToken, city);
router.get("/designation",authenticateToken, designation);
router.get("/customerentity",authenticateToken, customerentity);
router.get("/name",authenticateToken, name);
router.get("/showCustomerOpportunity/:customer_entity",authenticateToken, showCustomerOpportunity);

module.exports = router;