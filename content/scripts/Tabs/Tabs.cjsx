React = require "react"
ReactDOM = require "react-dom"

Tabs = React.createClass
	displayName: "Tabs"

	getInitialState: ->
		selectedIndex: 0

	render: ->
		tabs = React.Children.map @props.children, (tab, index) =>

			React.cloneElement tab,
				selected: @state.selectedIndex == index
				index: index
				onClick: @handleTabClick

		<ul className="nav nav-tabs">
			{tabs}
		</ul>

	handleTabClick: (tabIndex) ->
		@setState selectedIndex: tabIndex

module.exports = Tabs

		# 		<TabTemplate>
		# 			{currentTemplate}
		# 		</TabTemplate>