gulp = require "gulp"
postcss = require 'gulp-postcss'
postcssImp = require "postcss-import"
rename = require "gulp-rename"
cssnext = require 'postcss-cssnext'
postcssUrl = require "postcss-url"
cssnano = require "cssnano"
paths = require '../paths'
imagemin = require 'gulp-imagemin'

gulp.task 'images', ->
	gulp.src 'content/images/*/**'
	.pipe imagemin()
	.pipe gulp.dest paths.images

gulp.task 'css', ->
	processors = [
		postcssImp
		cssnext {
			browsers: [
				'last 2 versions'
				'> 5%'
				'> 5% in RU'
				'iOS >= 7'
				'IE >= 9'
			]
			features: calc: precision: 20
		}
		postcssUrl
	]
	gulp.src 'content/styles.css'
		.pipe postcss processors
		.pipe rename 'styles.css'
		.pipe gulp.dest paths.dist