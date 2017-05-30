gulp = require "gulp"
runSequence = require "run-sequence"
gutil = require "gulp-util"


gulp.task "default", ->
	global.watch = on
	runSequence(
		'html'
		'images'
		'css'
		"watch"
		"server"
	)
