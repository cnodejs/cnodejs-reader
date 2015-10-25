
= exports.get $ \ (store user)
  store.setIn ([] :users $ user.get :loginname) user

= exports.login $ \ (store loginname)
  store.setIn ([] :device :loginname) loginname
