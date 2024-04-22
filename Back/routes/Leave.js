const express = require("express");
const { showApplicationLeave,addApplicationLeave,editApplicationAdmin,showOneApplicationLeave} = require("../controller/Leave");
const router = express.Router();

const { authenticateToken } = require('../utils/authenticateToken ');

router.get("/showApplicationLeave", authenticateToken,showApplicationLeave);
router.get("/showOneApplicationLeave/:id", showOneApplicationLeave);
router.post("/addApplicationLeave", addApplicationLeave);
router.put("/editApplicationAdmin/:id", editApplicationAdmin);

module.exports = router;