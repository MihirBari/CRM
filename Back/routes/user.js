const express = require("express");
const { login, getUserData,addUser,getOneUserData, deleteUser,logout,editUser,requestResetPassword,ResetPassword,paidLeave,SickLeave,RestDetail } = require("../controller/user");


const router = express.Router();

router.post("/login", login);
router.get("/userData", getUserData);
router.get("/getOneUserData/:id", getOneUserData);
router.get("/logout", logout);
router.post("/addUser", addUser);
router.post("/RestDetail", RestDetail);
router.post("/requestResetPassword", requestResetPassword);
router.post("/ResetPassword/:token", ResetPassword);
router.put("/editUser/:id", editUser);
router.delete("/delete", deleteUser);


module.exports = router;