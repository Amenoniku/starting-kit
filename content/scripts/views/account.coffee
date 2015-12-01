React = require "react"
ReactDOM = require "react-dom"

Account = React.createClass
	displayName: "Account"
	
	render: ->
		random = ->
			min = 0
			max = 6
			rand = min - 0.5 + Math.random() * (max - min + 1)
			rand = Math.round(rand)

		<div class="private form">
			<h4>Личный Кабинет</h4>
			<p>Добро пожаловать в личный кабинет!</p>
			<img src="img/cats#{do random}.jpg" width="500" alt="cat"/>
		</div>

module.exports = Account