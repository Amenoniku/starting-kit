Account = require "./views/account"
React = require "react"
ReactDOM = require "react-dom"

# $ = require "jquery"

sendData = (e) ->
	do e.preventDefault
	form = @

	xhr = new XMLHttpRequest
	xhr.onreadystatechange = ->
		if @readyState != 4
			return
		res = @responseText

		if res == "success"
			ReactDOM.render <Account />, document.getElementById "wrapper"
		else
			alert res

	xhr.open "POST", "/auth.php"
	xhr.setRequestHeader "X-Requested-With", "XMLHttpRequest"
	formData = new FormData form
	xhr.send formData

module.exports = sendData