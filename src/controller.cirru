
var
  recorder $ require :actions-recorder
  Immutable $ require :immutable

var
  ajax $ require :./ajax
  actions $ require :./actions

= exports.start $ \ ()
  var
    store $ recorder.getStore
    page $ store.getIn $ [] :device :page
  actions.deviceLoading :start
  ajax.topicGetList (+ page 1) $ \ (topicList)
    actions.topicGetList topicList
    actions.deviceLoaded

  var
    maybeToken $ localStorage.getItem :cnodejs-reader-token
  if (? maybeToken) $ do
    exports.userAccesstoken maybeToken $ \ (loginname)
      exports.loopRequestMessages maybeToken

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
    exports.loopRequestMessages token

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

= exports.replyCreate $ \ (data)
  var
    token $ localStorage.getItem :cnodejs-reader-token
  ajax.replyCreate data token $ \ (id)
    ajax.topicGet data.topic_id $ \ (topic)
      actions.topicGet topic

= exports.topicMore $ \ ()
  var
    store $ recorder.getStore
    page $ store.getIn $ [] :device :page
  ajax.topicGetList (+ page 1) $ \ (topicList)
    actions.topicGetList topicList

= exports.topicRefresh $ \ ()
  actions.routerHome
  ajax.topicGetList 1 $ \ (topicList)
    actions.topicRefresh topicList

= exports.routerGo $ \ (info)
  switch (info.get :name)
    :home
      actions.routerHome
    :topic
      exports.routerTopic $ info.getIn $ [] :data :id
    :user
      exports.routerUser $ info.getIn $ [] :data :loginname
    :post
      actions.routerPost
    else
      actions.routerHome
  , undefined

= exports.loopRequestMessages $ \ (token)
  exports.messageGetList token
  setInterval
    \ ()
      exports.messageGetList token
    , 20000

= exports.messageGetList $ \ (token)
  var
    store $ recorder.getStore
    currentMessages $ store.get :messages
  ajax.messageGetList token $ \ (messages)
    if
      not $ Immutable.is
        Immutable.fromJS messages
        , currentMessages
      do $ actions.messageGetList messages
    , undefined

= exports.messageMarkAll $ \ ()
  var
    token $ localStorage.getItem :cnodejs-reader-token
  ajax.messageMarkAll token $ \ ()
    actions.messageMarkAll
