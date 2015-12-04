gulp = require "gulp"
gutil = require "gulp-util"
gulpif = require "gulp-if"
zip = require "gulp-zip"
paths = require "../paths"
pkg = require "../../package.json"

correctNumber = (number) ->
	if number < 10 then "0" + number else number

getDateTime = -> 
	now = new Date
	year = now.getFullYear()
	month = correctNumber now.getMonth() + 1
	day = correctNumber now.getDate()
	hours = correctNumber now.getHours()
	minutes = correctNumber now.getMinutes()

	return "#{year}-#{month}-#{day}-#{hours}:#{minutes}"

gulp.task "zip", ->
	datetime = do getDateTime
	zipName = "#{pkg.name}.zip"
	gulp.src ["./**/*", "!./node_modules/**", "!./*.zip"]
		.pipe zip zipName
		.pipe gulp.dest "./"