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
    sendPo} = require("../controller/opportunity");
const router = express.Router();


router.get("/showOpportunity",showOpportunity);
router.get("/showOneOpportunity/:id", showOneOpportunity);
router.post("/addOpportunity", addOpportunity);
router.put("/editOpportunity/:id", editOpportunity);
router.post("/name",name);
router.post("/acknowledge",acknowledge);
router.post("/PoLost",PoLost);
router.get("/sendAlert",sendAlert);
router.get("/sendPo",sendPo);
router.get("/customerEntityAlert",customerEntityAlert);
router.delete("/deleteOpportunity", deleteOpportunity);
module.exports = router; 