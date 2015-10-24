
var
  recorder $ require :actions-recorder

var
  ajax $ require :../ajax

= exports.start $ \ ()
  ajax.topicGetList $ \ (topicList)
    recorder.dispatch :topic/get-list topicList
  console.log :start
