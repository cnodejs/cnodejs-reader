
var
  Immutable $ require :immutable

= exports.store $ Immutable.fromJS $ {}
  :router $ {}
    :name :home
    :data $ {}
    :query $ {}
  :user null
  :topics $ []
  :topicDetails $ {}
  :replies $ []
  :messages $ []
  :device $ {}
    :messageCount 0
    :isLoading false
    :loadingKind null
