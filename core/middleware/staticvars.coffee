StaticVar = require("../modelsDB/staticVar").StaticVar

module.exports = (req, res, next) ->
	vrs = {}
	StaticVar.find {} , (err, staticVars) ->
		staticVars.forEach (item, i, arr) ->
			vrs[item.name] = item.value
		console.log vrs
		next err if err
		req.staticVar = res.locals.staticVar = vrs
		do next