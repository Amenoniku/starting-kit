gulp = require 'gulp'
paths = require '../paths'
browserSync = require 'browser-sync'
reload = browserSync.reload

gulp.task 'watch', ->
	gulp.watch "content/**/*.css", ['css', reload]
	gulp.watch "content/index.html", ['html', reload]
	gulp.watch "#{paths.dist}/bundle.js", reload
