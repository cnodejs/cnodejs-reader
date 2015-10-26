
var
  Immutable $ require :immutable

= exports.home $ \ (store id)
  ... store
    setIn ([] :router :name) :home
    setIn ([] :router :data) $ Immutable.Map

= exports.topic $ \ (store id)
  ... store
    setIn ([] :router :name) :topic
    setIn ([] :router :data :id) id

= exports.user $ \ (store loginname)
  ... store
    setIn ([] :router :name) :user
    setIn ([] :router :data :loginname) loginname

= exports.post $ \ (store)
  ... store
    setIn ([] :router :name) :post
    setIn ([] :router :data) $ Immutable.Map

= exports.go $ \ (store info)
  store.set :router info
