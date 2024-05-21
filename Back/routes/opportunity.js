const express = require("express");
const {     showOpportunity,
    showOneOpportunity,
    addOpportunity,
    editOpportunity,
    name,
    acknowledge,sendAlert,
    deleteOpportunity} = require("../controller/opportunity");
const router = express.Router();


router.get("/showOpportunity",showOpportunity);
router.get("/showOneOpportunity/:id", showOneOpportunity);
router.post("/addOpportunity", addOpportunity);
router.put("/editOpportunity/:id", editOpportunity);
router.post("/name",name);
router.post("/acknowledge",acknowledge);
router.get("/sendAlert",sendAlert);
router.delete("/deleteOpportunity", deleteOpportunity);
module.exports = router; 