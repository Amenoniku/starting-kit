gutil = require "gulp-util"
prettyHrtime = require "pretty-hrtime"
startTime = null

module.exports =
	start: (filepath) ->
		startTime = do process.hrtime
		gutil.log "Bundling", gutil.colors.green filepath + "..."

	end: (filepath) ->
		taskTime = process.hrtime startTime
		prettyTime = prettyHrtime taskTime
		gutil.log "Bundled", gutil.colors.green filepath, "in", gutil.colors.cyan prettyTime