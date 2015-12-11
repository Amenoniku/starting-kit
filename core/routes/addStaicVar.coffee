express = require "express"
router = do express.Router
StaticVar = require("../modelsDB/staticVar").StaticVar
checkRight = require "../middleware/checkright"
HttpError = require("../error").HttpError

router.route "/"
	.get checkRight, (req, res, next) ->
		if req.query != {}
			console.log req.query
			for k, v of req.query
				StaticVar.save k, v, (err) ->
					return next err if err
		res.redirect "/"

module.exports = router