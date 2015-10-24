
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
  actions.deviceLoading :topic
  ajax.topicGet id $ \ (topic)
    actions.topicGet topic
    actions.routerTopic id
    actions.deviceLoaded
