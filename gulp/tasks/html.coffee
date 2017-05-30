gulp = require 'gulp'
template = require 'gulp-template'
paths = require '../paths'
 
gulp.task 'html', ->
	gulp.src 'content/index.html'
		.pipe gulp.dest paths.dist