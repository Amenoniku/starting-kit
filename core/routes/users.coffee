express = require "express"
router = do express.Router
User = require('../modelsDB/user').User

### GET users listing. ###

router.route "/"
	.get (req, res, next) ->
		User.find {}, (err, users) ->
			next err if err
			renderVar = 
				title: "Пользователи"
				users: users
				superAdmin: no
			res.render "users", renderVar

module.exports = router
