StaticVar = require("../modelsDB/staticVar").StaticVar

module.exports = (req, res, next) ->
	vrs = {}
	StaticVar.find {} , (err, staticVars) ->
		return next err if err
		staticVars.forEach (item, i, arr) ->
			vrs[item.name] = item.value
		next err if err
		req.staticVar = res.locals.staticVar = vrs
		do next