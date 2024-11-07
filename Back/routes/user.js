const express = require("express");
const { login, getUserData,addUser,getOneUserData, deleteUser,logout,editUser,requestResetPassword,ResetPassword,RestDetail } = require("../controller/user");
const { authenticateToken } = require("../utils/authenticateToken ");


const router = express.Router();

router.post("/login", login);
router.get("/userData",authenticateToken, getUserData);
router.get("/getOneUserData/:id",authenticateToken, getOneUserData);
router.get("/logout", logout);
router.post("/addUser",authenticateToken, addUser);
router.post("/RestDetail",authenticateToken, RestDetail);
router.post("/requestResetPassword",authenticateToken, requestResetPassword);
router.post("/ResetPassword/:token",authenticateToken, ResetPassword);
router.put("/editUser/:id",authenticateToken, editUser);
router.delete("/delete",authenticateToken, deleteUser);


module.exports = router;