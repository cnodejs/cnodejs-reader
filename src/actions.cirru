
var
  recorder $ require :actions-recorder
  dispatch recorder.dispatch

= exports.routerHome $ \ () (dispatch :router/home)
= exports.routerTopic $ \ (id) (dispatch :router/topic id)
= exports.routerUser $ \ (loginname) (dispatch :router/user loginname)
= exports.routerMessage $ \ () (dispatch :router/message)
= exports.routerPost $ \ () (dispatch :router/post)

= exports.topicGetList $ \ (topicList) (dispatch :topic/get-list topicList)
= exports.topicGet $ \ (topicList) (dispatch :topic/get topicList)

= exports.deviceLoading $ \ (kind) (dispatch :device/loading kind)
= exports.deviceLoaded $ \ () (dispatch :device/loaded)

= exports.userGet $ \ (user) (dispatch :user/get user)
= exports.userLogin $ \ (user) (dispatch :user/login user)
