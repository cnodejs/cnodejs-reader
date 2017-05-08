'use strict'
user = require('./user')
topic = require('./topic')
reply = require('./reply')
router = require('./router')
device = require('./device')
message = require('./message')

id = (x) ->
  x

module.exports = (store, actionType, actionData) ->
  handler = do ->
    switch actionType
      when 'topic/get-list'
        return topic.getList
      when 'topic/get'
        return topic.get
      when 'topic/refresh'
        return topic.refresh
      when 'device/loading'
        return device.loading
      when 'device/loaded'
        return device.loaded
      when 'router/home'
        return router.home
      when 'router/topic'
        return router.topic
      when 'router/user'
        return router.user
      when 'router/post'
        return router.post
      when 'router/go'
        return router.go
      when 'user/get'
        return user.get
      when 'user/login'
        return user.login
      when 'message/get-list'
        return message.getList
      when 'message/mark-all'
        return message.markAll
      else
        return id
    return
  handler store, actionData
