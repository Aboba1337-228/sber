const express = require("express")
const user = require("../controller/userController")
const materials = require("../controller/materialsController")
const news = require("../controller/newsController")
const resultsTable = require("../controller/resultController")
const ismynicipal = require("../controller/mynicipalController")

const router = express() 

// User
router.post("/loginByToken", user.loginByToken)
router.post("/login", user.login)
router.post("/register", user.register)
router.get("/infoByToken", user.infoByToken)
router.post("/changeInfoUserByToken", user.changeInfoUserByToken)

// Materials
router.post("/materials", materials.ButtonTextMaterials)
router.post("/testQuest", materials.testQuest)
router.post("/testAnswer", materials.testAnswer)

// News
router.post("/news", news.isNews)

//Result
router.post("/loading", resultsTable.isUpLoading)
router.post("/unloading", resultsTable.isUnLoading)

//Mynicipal
router.post("/mynicipal", ismynicipal.isSelect)
router.post("/addmynicipal", ismynicipal.addMynicipal)

module.exports = router
