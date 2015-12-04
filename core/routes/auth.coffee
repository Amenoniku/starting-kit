express = require "express"
router = do express.Router
User = require('../modelsDB/user').User

### GET users listing. ###

router.route "/"
	.get (req, res, next) ->
		res.render "auth"

module.exports = router
