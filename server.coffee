express = require('express')
path = require('path')
logger = require('morgan')
connectAssets = require('connect-assets');


app = express()

# view engine setup
app.set 'views', path.join(__dirname, 'views')
app.set 'view engine', 'jade'

# assets setup
app.use connectAssets
  paths: [path.join(__dirname, 'assets/js'),
          path.join(__dirname, 'assets/css'),
          path.join(__dirname, 'bower_components')]
  buildDir: 'public/assets'

app.use logger('dev')
app.use express.static(path.join(__dirname, 'public'))

# index page
app.get '/', (req, res) ->
  res.render 'index'

# catch 404 and forward to error handler
app.use (req, res, next) ->
  err = new Error('Not Found')
  err.status = 404
  next err

# error handlers
# development error handler
# will print stacktrace
if app.get('env') == 'development'
  app.use (err, req, res, next) ->
    res.status err.status or 500
    res.render 'error',
      message: err.message
      error: err

# production error handler
# no stacktraces leaked to user
app.use (err, req, res, next) ->
  res.status err.status or 500
  res.render 'error',
    message: err.message
    error: {}

module.exports = app
