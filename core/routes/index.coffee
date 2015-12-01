express = require "express"
router = do express.Router

### GET home page. ###

router.get "/", (req, res, next) ->
	res.render "root", title: "Express"

module.exports = router