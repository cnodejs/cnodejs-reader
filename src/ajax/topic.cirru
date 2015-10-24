
var
  reqwest $ require :reqwest

= exports.getList $ \ (cb)
  reqwest $ {}
    :url :https://cnodejs.org/api/v1/topics
    :type :json
    :method :get
    :contentType :application/json
    :success $ \ (data)
      cb data.data
    :error $ \ (error)
      console.log :error error

= exports.get $ \ (id cb)
  reqwest $ {}
    :url $ + :https://cnodejs.org/api/v1/topic/ id
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
