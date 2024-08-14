const express = require("express");
const { showApplicationLeave,addApplicationLeave,editApplicationAdmin,showOneApplicationLeave,deleteApplication,leaveConfirm} = require("../controller/Leave");
const router = express.Router();

router.post("/showApplicationLeave", showApplicationLeave);
router.get("/showOneApplicationLeave/:id", showOneApplicationLeave);
router.post("/addApplicationLeave", addApplicationLeave);
router.put("/leaveConfirm/:id", leaveConfirm);
router.put("/editApplicationAdmin/:id", editApplicationAdmin);
router.delete("/deleteApplication",deleteApplication)

module.exports = router;