
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
        actions.deviceLoaded
  , undefined
