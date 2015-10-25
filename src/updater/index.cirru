
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

    :device/loading device.loading
    :device/loaded device.loaded

    :router/topic router.topic
    :router/user router.user

    :user/get user.get

    else id

  handler store actionData
