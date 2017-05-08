'use strict'
Immutable = require('immutable')
exports.store = Immutable.fromJS(
  router:
    name: 'home'
    data: {}
    query: {}
  topics: []
  users: {}
  topicDetails: {}
  replies: []
  messages: []
  device:
    messageCount: 0
    isLoading: false
    loadingKind: null
    loginname: null
    page: 0
    isTopicEnd: false)
