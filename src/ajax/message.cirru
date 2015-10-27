
var
  reqwest $ require :reqwest

var
  configs $ require :../configs

= exports.count $ \ ()

= exports.getList $ \ (token cb)
  reqwest $ {}
    :url $ + configs.domain :/api/v1/messages
    :type :json
    :data $ {}
      :accesstoken token
    :method :get
    :contentType :application/json
    :success $ \ (data)
      cb data.data.hasnot_read_messages
    :error $ \ (error)
      console.log :error error

= exports.markAll $ \ ()
