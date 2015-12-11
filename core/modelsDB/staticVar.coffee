mongoose = require "../libs/mongoose"
util = require "util"
HttpError = require("../error").HttpError

Schema = mongoose.Schema

schema = new Schema
	name:
		type: String
		required: on
		unique: on
	value:
		type: String
		required: on

schema.statics.save = (k, v) ->
	StaticVar = @
	vrs = new StaticVar name: k, value: v
	vrs.save (err) ->
		console.log err if err
		console.log "Saved"
		# do next new SaveError err.message
	# do next

exports.StaticVar = mongoose.model("StaticVar", schema)

class SaveError
	constructor: (message) ->
		Error.apply @, arguments
		Error.captureStackTrace @, SaveError
		@message = message

util.inherits SaveError, Error

exports.SaveError = SaveError