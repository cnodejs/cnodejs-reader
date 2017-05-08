'use strict'
Immutable = require('immutable')

exports.getList = (store, messageList) ->
  store.set 'messages', messageList

exports.markAll = (store) ->
  store.set 'messages', Immutable.List()
