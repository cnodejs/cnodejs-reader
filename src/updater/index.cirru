
var
  user $ require :./user
  topic $ require :./topic
  reply $ require :./reply
  message $ require :./message

= module.exports $ \ (store actionType actionData)
  case actionType
    :topic/get-list $ topic.getList store actionData
    else store
