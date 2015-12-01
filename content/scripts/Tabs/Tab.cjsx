classNames = require "classnames"
Auth = require "../views/authorization"
Reg = require "../views/registration"
sendData = require "../dispatch"
React = require "react"
ReactDOM = require "react-dom"

template = (Tpl) ->
	ReactDOM.render <Tpl />, document.getElementById "wrapper"
	form = document.getElementById "form-auth"
	form.addEventListener "submit", sendData

Tab = React.createClass
	displayName: "Tab"

	render: ->
		tpl = @props.tpl
		tabClass = classNames
			"active": @props.selected

		<li className={tabClass} onClick={@handleClick} role="presentation">
			<a className={tpl} href="#">
				<span className={tpl}>
					{@props.label}
				</span>
			</a>
		</li>

console.log Reg

	handleClick: (e) ->
		do e.preventDefault
		if e.target.classList[0] == "reg"
			template Reg
		if e.target.classList[0] == "auth"
			template Auth
		@props.onClick @props.index

template Auth

module.exports = Tab