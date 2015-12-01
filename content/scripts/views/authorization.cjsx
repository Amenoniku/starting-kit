React = require "react"
ReactDOM = require "react-dom"

Authorozation = React.createClass
	displayName: "Authorozation"

	render: ->
		<div className="">
			<form action="auth.php" method="POST" role="form" className="form-auth" id="form-auth">
				<legend>Авторизация</legend>
				<div className="form-group">
					<label for="">Номер телефона</label>
					<input name="login" type="text" id="" className="form-control" defaultValue="admin" required/>
				</div>
				<div className="form-group">
					<label for="">Пароль</label>
					<input name="pass" type="password" id="" className="form-control" defaultValue="123" required/>
				</div>
				<button type="submit" className="btn btn-primary">Войти</button>
			</form>
		</div>

module.exports = Authorozation