
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

= exports.create $ \ (data token cb)
  reqwest $ {}
    :url $ + configs.domain :/api/v1/topics
    :data $ JSON.stringify $ {}
      :title data.title
      :content data.content
      :tab data.tab
      :accesstoken token
    :type :json
    :method :post
    :contentType :application/json
    :success $ \ (data)
      cb data.topic_id
    :error $ \ (error)
      console.log :error error

= exports.collect $ \ ()

= exports.deCollection $ \ ()
