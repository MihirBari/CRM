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
const router = express.Router();


router.get("/showContact/:customer_entity" ,showContact);
router.get("/showCustomer" ,showCustomer);
router.get("/showOneContact/:id", showOneContact);
router.get("/showOneCustomer/:id", showOneCustomer);
router.post("/addContact", addContact);
router.post("/addCustomer", addCustomer);
router.put("/editContact/:id", editContact);
router.put("/editCustomer/:id", editCustomer);
router.delete("/deleteContact", deleteContact);
router.delete("/deleteCustomer", deleteCustomer);
router.get("/city", city);
router.get("/designation", designation);
router.get("/customerentity", customerentity);
router.get("/name", name);
router.get("/showCustomerOpportunity/:customer_entity", showCustomerOpportunity);

module.exports = router;