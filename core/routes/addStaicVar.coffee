express = require("express")
router = express.Router()
StaticVar = require("../modelsDB/staticVar").StaticVar
HttpError = require("../error").HttpError

router.route "/"
	.get (req, res, next) ->
		for k, v of req.query 
			# console.log req.query
			StaticVar.save k, v, (err) ->
				console.log err if err

module.exports = router