express = require("express")
router = express.Router()
StaticVar = require("../modelsDB/staticVar").StaticVar
HttpError = require("../error").HttpError

router.route "/"
	.get (req, res, next) ->
		if req.query != {}
			console.log req.query
			for k, v of req.query 
				# console.log req.query
				StaticVar.save k, v, (err) ->
					console.log err if err
			# res.send {}
		res.send {}

module.exports = router