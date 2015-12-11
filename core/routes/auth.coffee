express = require "express"
router = do express.Router
multer = require "multer"
util = require "util"
User = require("../modelsDB/user").User
AuthError = require("../modelsDB/user").AuthError

upload = do multer

router.route "/"
	.get (req, res, next) ->
		res.render "auth"
	.post upload.array(), (req, res, next) ->
		login = req.body.login
		pass = req.body.pass
		User.authorize login, pass, (err, user) ->
			if err
				if err instanceof AuthError
					return res.send err.message
				else
					return next err
			req.session.user = user._id
			res.send "success"

router.route "/logout"
	.post (req, res, next) ->
		req.session.destroy (err) ->
			next err if err
		res.redirect "/"

module.exports = router
