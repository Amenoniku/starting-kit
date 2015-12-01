Tabs = require "./Tabs/Tabs"
Tab = require "./Tabs/Tab"
React = require "react"
ReactDOM = require "react-dom"

App = React.createClass
	displayName: "App"

	render: ->
		<Tabs>
			<Tab label="Авторизация" tpl="auth">
			</Tab>
			<Tab label="Регистрация" tpl="reg">
			</Tab>
		</Tabs>

module.exports = App