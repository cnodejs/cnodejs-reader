
var
  reqwest $ require :reqwest

var
  configs $ require :../configs

= exports.create $ \ (data token cb)
  reqwest $ {}
    :url $ + configs.domain :/api/v1/topic/ data.topic_id :/replies
    :data $ JSON.stringify $ {}
      :accesstoken token
      :content data.content
      :reply_id data.reply_id
    :type :json
    :method :post
    :contentType :application/json
    :success $ \ (data)
      cb data.reply_id
    :error $ \ (error)
      console.log :error error
      alert $ JSON.stringify error

= exports.up $ \ ()
