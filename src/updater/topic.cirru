
var
  Immutable $ require :immutable

= exports.getList $ \ (store topicList)
  ... store
    update :topics $ \ (topics) (topics.concat topicList)
    updateIn ([] :device :page) $ \ (page) (+ page 1)
    setIn ([] :device :isTopicEnd) $ is topicList.size 0

= exports.get $ \ (store topicData)
  store.setIn ([] :topicDetails $ topicData.get :id) topicData

= exports.refresh $ \ (store topicList)
  ... store
    set :topics topicList
    set :topicDetails $ Immutable.Map
    setIn ([] :device :page) 1
    setIn ([] :device :isTopicEnd) false
