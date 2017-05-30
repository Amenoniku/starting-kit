gulp = require "gulp"
gutil = require "gulp-util"
paths = require '../paths'
browserSync = require("browser-sync").create()

gulp.task "server", ->
	browserSync.init
		files: paths.dist
		open: !!gutil.env.open
		reloadOnRestart: true
		port: gutil.env.port or 8000
		server:
			baseDir: paths.dist
			middleware: (req, res, next) ->
				res.setHeader 'Access-Control-Allow-Origin', '*'
				do next
