
= exports.getList $ \ (store topicList)
  store.set :topics topicList

= exports.get $ \ (store topicData)
  store.setIn ([] :topicDetails $ topicData.get :id) topicData

