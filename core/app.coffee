express      =                 require "express"
path         =                    require "path"
favicon      =           require "serve-favicon"
logger       =                  require "morgan"
cookieParser =           require "cookie-parser"
bodyParser   =             require "body-parser"
errorhandler =            require "errorhandler"
session      =         require "express-session"
MongoStore   = require("connect-mongo")(session)
# fs         =                      require "fs"
config       =                require "./config"
mongoose     =         require "./libs/mongoose"
HttpError    =      require("./error").HttpError
routes       =          require "./routes/index"
auth         =           require "./routes/auth"
addStaicVars =    require "./routes/addStaicVar"

mongooseStore = new MongoStore mongooseConnection: mongoose.connection
app = do express

# view engine setup
app.set "views", path.join(__dirname, "../content/views")
app.set "view engine", "jade"

# uncomment after placing your favicon in /public
# app.use favicon path.join __dirname, "public", "favicon.ico"

# accessLogStream = fs.createWriteStream __dirname + "/access.log", flags: "a"
app.use logger "dev"
	# skip: (req, res) -> return res.statusCode < 400
	# stream: accessLogStream

app.use do bodyParser.json
app.use bodyParser.urlencoded extended: on
app.use do cookieParser

### Sessions ###
sessionStore = require "./libs/sessionSrote"
app.use session
	secret: config.get "session:secret"
	key: config.get "session:key"
	cookie: config.get "session:cookie"
	saveUninitialized: true
	resave: true
	store: sessionStore

app.use require "./middleware/sendHttpError"
app.use express.static path.join __dirname, "public"

app.use require "./middleware/loadUser"
app.use require "./middleware/staticvars"

### Routes uses ###
app.use "/", routes
app.use "/addstaticvar", addStaicVars
app.use "/auth", auth

### 404 ###
app.use (req, res, next) ->
	error = 
		message: "Страница не найдена."
		status: 404
	res.render "error", error

app.use (err, req, res, next) ->
	if typeof err == "number"
		err = new HttpError(err)
	if err instanceof HttpError
		res.sendHttpError err
	else
		if app.get("env") == "development"
			errorhandler() err, req, res, next
		else
			console.log error err
			err = new HttpError(500)
			res.sendHttpError err
	return

module.exports = app