
= exports.get $ \ (store user)
  store.setIn ([] :users $ user.get :loginname) user
