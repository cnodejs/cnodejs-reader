
var
  rx $ require :rx
  rxDOM $ require :rx-dom

= exports.getList $ \ (cb)
  ... rx.DOM
    getJSON :https://cnodejs.org/api/v1/topics
    subscribe
      \ (data)
        cb data.data
      \ (err)
        console.log :err err

= exports.get $ \ (id)

= exports.create $ \ ()

= exports.collect $ \ ()

= exports.deCollection $ \ ()
