
express = require 'express'
cors = require 'cors'
request = require 'request'
fs = require 'fs'

app = express()

corsOptions =
  origin: (origin, cb) ->
    console.log origin
    cb null, yes

c = cors corsOptions

app.get '/topics', c, (req, res) ->
  x = request('https://cnodejs.org/api/v1/topics')
  req.pipe x
  x.pipe res

app.get '/mock/topics', c, (req, res) ->
  fs.createReadStream('./data/topics.json').pipe res

app.get '/topic/:id', c, (req, res) ->
  x = request("https://cnodejs.org/api/v1/topic/#{req.params.id}")
  req.pipe x
  x.pipe res

app.get '/mock/topic', c, (req, res) ->
  fs.createReadStream('./data/topic.json').pipe res

app.get '/user/:loginanme', c, (req, res) ->
  x = request("https://cnodejs.org/api/v1/user/#{req.params.loginanme}")
  req.pipe x
  x.pipe res

app.get '/mock/user', c, (req, res) ->
  fs.createReadStream('./data/user.json').pipe res

app.get '/', c, (req, res) ->
  res.json content: 'test page'

app.listen 3000
console.log 'started server at 3000'
