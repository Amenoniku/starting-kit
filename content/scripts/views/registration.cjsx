React = require "react"
ReactDOM = require "react-dom"

Registration = React.createClass
	displayName: "Registration"

	render: ->
		<div className="">
			<form action="auth.php" method="POST" role="form" className="form-auth" id="form-auth">
				<legend>Регистрация</legend>
				<div className="form-group">
					<label for="">Номер телефона</label>
					<input type="text" name="login" placeholder="Input field" className="form-control"/>
				</div>
				<div className="form-group">
					<label for="">Код подтверждения</label>
					<input type="text" id="" placeholder="Input field" className="form-control"/>
				</div>
				<div className="form-group">
					<label for="">Пароль</label>
					<input type="text" name="pass" placeholder="Input field" className="form-control"/>
				</div>
				<div className="form-group">
					<label for="">Повторите пароль:</label>
					<input type="text" id="" placeholder="Input field" className="form-control"/>
				</div>
				<button type="submit" className="btn btn-primary">Зарегистрироваться</button>
			</form>
		</div>

module.exports = Registration