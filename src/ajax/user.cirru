
var
  reqwest $ require :reqwest

var
  configs $ require :../configs

= exports.get $ \ (loginname token cb)
  reqwest $ {}
    :url $ + configs.domain :/api/v1/user/ loginname
    :type :json
    :data $ {}
      :accesstoken token
    :method :get
    :contentType :application/json
    :success $ \ (data)
      cb data.data
    :error $ \ (error)
      console.log :error error

= exports.accesstoken $ \ (token cb)
  reqwest $ {}
    :url $ + configs.domain :/api/v1/accesstoken
    :data $ JSON.stringify $ {} (:accesstoken token)
    :type :json
    :method :post
    :contentType :application/json
    :success $ \ (data)
      cb data.loginname
    :error $ \ (error)
      console.log :error error
