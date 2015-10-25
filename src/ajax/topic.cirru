
var
  reqwest $ require :reqwest

var
  configs $ require :../configs

= exports.getList $ \ (cb)
  reqwest $ {}
    :url $ + configs.domain :/api/v1/topics
    :type :json
    :method :get
    :contentType :application/json
    :success $ \ (data)
      cb data.data
    :error $ \ (error)
      console.log :error error

= exports.get $ \ (id cb)
  reqwest $ {}
    :url $ + configs.domain :/api/v1/topic/ id
    :data $ []
      {} (:name :mdrender) (:value false)
    :type :json
    :method :get
    :contentType :application/json
    :success $ \ (data)
      cb data.data
    :error $ \ (error)
      console.log :error error

= exports.create $ \ ()

= exports.collect $ \ ()

= exports.deCollection $ \ ()
