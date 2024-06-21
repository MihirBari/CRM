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
    product
  } = require("../controller/opportunity");
const router = express.Router();
const multer = require('multer');
const upload = multer({
    limits: { fileSize: 50 * 1024 * 1024 }, // 50 MB limit
  });

  const { authenticateToken } = require('../utils/authenticateToken ');

router.get("/showOpportunity",authenticateToken,showOpportunity);
router.get("/showOneOpportunity/:id", showOneOpportunity);
router.post("/addOpportunity",upload.single('file'), addOpportunity);
router.put("/editOpportunity/:id", upload.single('file'),  editOpportunity);
router.post("/name",name);
router.post("/acknowledge",acknowledge);
router.post("/PoLost",PoLost);
router.get("/sendAlert",sendAlert);
router.get("/sendPo",sendPo);
router.post("/reminder",reminder);
router.get("/customerEntityAlert",customerEntityAlert);
router.get("/product",product);
router.delete("/deleteOpportunity", deleteOpportunity);
module.exports = router; 