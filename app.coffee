express = require 'express'
cors = require 'cors'
bodyParser = require 'body-parser'

changes = require './changes'

app = express()
app.use bodyParser.json()
app.use bodyParser.urlencoded(extended: true)
app.use cors()

app.use '/', express.static './ui'
app.use '/changes', changes

server = app.listen 3000, () ->
  console.log server.address()