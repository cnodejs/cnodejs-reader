
var
  user $ require :./user
  topic $ require :./topic
  reply $ require :./reply
  router $ require :./router
  device $ require :./device
  message $ require :./message

var id $ \ (x) x

= module.exports $ \ (store actionType actionData)
  var handler $ case actionType
    :topic/get-list topic.getList
    :topic/get topic.get
    :topic/refresh topic.refresh

    :device/loading device.loading
    :device/loaded device.loaded

    :router/home router.home
    :router/topic router.topic
    :router/user router.user
    :router/post router.post
    :router/go router.go

    :user/get user.get
    :user/login user.login

    else id

  handler store actionData
