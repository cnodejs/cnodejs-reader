
var
  reqwest $ require :reqwest

var
  configs $ require :../configs

= exports.get $ \ (loginname cb)
  reqwest $ {}
    :url $ + configs.domain :/api/v1/user/ loginname
    :type :json
    :method :get
    :contentType :application/json
    :success $ \ (data)
      cb data.data
    :error $ \ (error)
      console.log :error error

= exports.accesstoken $ \ (token)
