
recorder = require('actions-recorder')
Immutable = require('immutable')
ajax = require('./ajax')
actions = require('./actions')

exports.start = ->
  store = recorder.getStore()
  page = store.getIn(['device', 'page'])
  actions.deviceLoading 'start'
  ajax.topicGetList page + 1, (topicList) ->
    actions.topicGetList topicList
    actions.deviceLoaded()
  maybeToken = localStorage.getItem('cnodejs-reader-token')
  if maybeToken?
    exports.userAccesstoken maybeToken, (loginname) ->
      exports.loopRequestMessages maybeToken

exports.routerTopic = (id) ->
  store = recorder.getStore()
  if store.hasIn(['topicDetails', id])
    actions.routerTopic id
  else
    actions.deviceLoading 'topic'
    ajax.topicGet id, (topic) ->
      actions.topicGet topic
      actions.routerTopic id
      actions.deviceLoaded()

exports.routerUser = (loginname) ->
  store = recorder.getStore()
  if store.hasIn(['users', loginname])
    actions.routerUser loginname
  else
    actions.deviceLoading 'user'
    maybeToken = localStorage.getItem('cnodejs-reader-token')
    if maybeToken != null
      ajax.userGet loginname, maybeToken, (user) ->
        actions.userGet user
        actions.routerUser loginname
      actions.deviceLoaded()
  undefined

exports.userAccesstoken = (token) ->
  ajax.userAccesstoken token, (loginname) ->
    actions.userLogin loginname
    localStorage.setItem 'cnodejs-reader-token', token
    exports.loopRequestMessages token

exports.routerPost = ->
  actions.routerPost()

exports.topicCreate = (data) ->
  token = localStorage.getItem('cnodejs-reader-token')
  actions.deviceLoaded 'topic'
  ajax.topicCreate data, token, (id) ->
    ajax.topicGet id, (topic) ->
      actions.topicGet topic
      actions.routerTopic id
      actions.deviceLoaded()

exports.replyCreate = (data) ->
  token = localStorage.getItem('cnodejs-reader-token')
  ajax.replyCreate data, token, (id) ->
    ajax.topicGet data.topic_id, (topic) ->
      actions.topicGet topic

exports.topicMore = ->
  store = recorder.getStore()
  page = store.getIn(['device', 'page'])
  ajax.topicGetList page + 1, (topicList) ->
    actions.topicGetList topicList

exports.topicRefresh = ->
  actions.routerHome()
  ajax.topicGetList 1, (topicList) ->
    actions.topicRefresh topicList

exports.routerGo = (info) ->
  switch info.get('name')
    when 'home'
      actions.routerHome()
    when 'topic'
      exports.routerTopic info.getIn(['data', 'id'])
    when 'user'
      exports.routerUser info.getIn(['data', 'loginname'])
    when 'post'
      actions.routerPost()
    else
      actions.routerHome()
      break

exports.loopRequestMessages = (token) ->
  exports.messageGetList token
  setInterval ->
    exports.messageGetList token
  , 20000

exports.messageGetList = (token) ->
  store = recorder.getStore()
  currentMessages = store.get('messages')
  ajax.messageGetList token, (messages) ->
    if !Immutable.is(Immutable.fromJS(messages), currentMessages)
      actions.messageGetList messages

exports.messageMarkAll = ->
  token = localStorage.getItem('cnodejs-reader-token')
  ajax.messageMarkAll token, ->
    actions.messageMarkAll()
