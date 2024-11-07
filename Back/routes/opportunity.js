const express = require("express");
const {     showOpportunity,
    showOneOpportunity,
    addOpportunity,
    editOpportunity,
    name,
    acknowledge,sendAlert,
    deleteOpportunity,
    customerEntityAlert,
    PoLost,
    sendPo,
    reminder,
    product,
    customerPOEntityAlert,
    editAlertOpportunity
  } = require("../controller/opportunity");
const router = express.Router();
const multer = require('multer');
const upload = multer({
    limits: { fileSize: 50 * 1024 * 1024 }, // 50 MB limit
  });

  const { authenticateToken } = require("../utils/authenticateToken ");

router.get("/showOpportunity",authenticateToken,showOpportunity);
router.get("/showOneOpportunity/:id",authenticateToken, showOneOpportunity);
router.post("/addOpportunity",upload.single('file'),authenticateToken, addOpportunity);
router.put("/editOpportunity/:id", upload.single('file'), authenticateToken, editOpportunity);
router.post("/name",authenticateToken,name);
router.post("/acknowledge",authenticateToken, acknowledge);
router.post("/PoLost",authenticateToken, PoLost);
router.get("/sendAlert",authenticateToken, sendAlert);
router.get("/sendPo",authenticateToken, sendPo);
router.post("/reminder",authenticateToken, reminder);
router.get("/customerEntityAlert",authenticateToken, customerEntityAlert);
router.get("/product",authenticateToken, product);
router.get("/customerPOEntityAlert",authenticateToken, customerPOEntityAlert);
router.delete("/deleteOpportunity",authenticateToken,  deleteOpportunity);
router.post("/editAlertOpportunity",authenticateToken, editAlertOpportunity);
module.exports = router; 