
var
  recorder $ require :actions-recorder

var
  ajax $ require :./ajax
  actions $ require :./actions

= exports.start $ \ ()
  actions.deviceLoading :start
  ajax.topicGetList $ \ (topicList)
    actions.topicGetList topicList
    actions.deviceLoaded

  var
    maybeToken $ localStorage.getItem :cnodejs-reader-token
  if (? maybeToken) $ do
    exports.userAccesstoken maybeToken

  , undefined

= exports.routerTopic $ \ (id)
  var
    store $ recorder.getStore

  if (store.hasIn $ [] :topicDetails id)
    do
      actions.routerTopic id
    do
      actions.deviceLoading :topic
      ajax.topicGet id $ \ (topic)
        actions.topicGet topic
        actions.routerTopic id
        actions.deviceLoaded
  , undefined

= exports.routerUser $ \ (loginname)
  var
    store $ recorder.getStore

  if (store.hasIn $ [] :users loginname)
    do
      actions.routerUser loginname
    do
      actions.deviceLoading :user
      ajax.userGet loginname $ \ (user)
        actions.userGet user
        actions.routerUser loginname
        actions.deviceLoaded
  , undefined

= exports.userAccesstoken $ \ (token)
  ajax.userAccesstoken token $ \ (loginname)
    actions.userLogin loginname
    localStorage.setItem :cnodejs-reader-token token

= exports.routerPost $ \ ()
  actions.routerPost

= exports.topicCreate $ \ (data)
  var
    token $ localStorage.getItem :cnodejs-reader-token
  actions.deviceLoaded :topic
  ajax.topicCreate data token $ \ (id)
    ajax.topicGet id $ \ (topic)
      actions.topicGet topic
      actions.routerTopic id
      actions.deviceLoaded
