'use strict'
user = require('./user')
reply = require('./reply')
topic = require('./topic')
message = require('./message')
exports.topicGet = topic.get
exports.topicCreate = topic.create
exports.topicGetList = topic.getList
exports.topicCollect = topic.collect
exports.topicDeCollect = topic.deCollect
exports.userGet = user.get
exports.userAccesstoken = user.accesstoken
exports.replyUp = reply.up
exports.replyCreate = reply.create
exports.messageCount = message.count
exports.messageMarkAll = message.markAll
exports.messageGetList = message.getList
