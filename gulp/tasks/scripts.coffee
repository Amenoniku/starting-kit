gulp = require "gulp"
browserify = require "browserify"
watchify = require "watchify"
source = require "vinyl-source-stream"
bundleLogger = require "../util/bundleLogger"
handleErrors = require "../util/handleErrors"
paths = require "../paths"

# External dependencies we do not want to rebundle while developing
dependencies =
	react: "./node_modules/react"
	reactDOM: "./node_modules/react-dom"
	classnames: "./node_modules/classnames"

gulp.task "scripts", ->
	#==========  Client bundler  ==========#

	clientBundler = browserify
		cache: {}, packageCache: {}
		entries: "./content/scripts/main.coffee"
		extensions: [".cjsx", ".coffee"]

	for k, v of dependencies
		clientBundler.external k

	rebundle = ->
		bundleLogger.start "client.js"

		clientBundler.bundle()
			.on "error", handleErrors
			.pipe source "client.js"
			.pipe gulp.dest paths.scripts
			.on "end", ->
				bundleLogger.end "client.js"

	if global.watch
		clientBundler = watchify clientBundler
		clientBundler.on "update", rebundle
	do rebundle

	#==========  Vendor bundler  ==========#

	# vendorBundler = browserify
	# 	cache: {}, packageCache: {}
	# 	extensions: [".coffee"]

	# for k, v of dependencies
	# 	vendorBundler.require v, expose: k

	# bundleLogger.start "vendor.js"

	# vendorBundler.bundle()
	# 	.on "error", handleErrors
	# 	.pipe source "vendor.js"
	# 	.pipe gulp.dest paths.scripts
	# 	.on "end", ->
	# 		bundleLogger.end "vendor.js"