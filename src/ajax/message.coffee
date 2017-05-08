'use strict'
reqwest = require('reqwest')
configs = require('../configs')

exports.count = ->

exports.getList = (token, cb) ->
  reqwest
    url: configs.domain + '/api/v1/messages'
    type: 'json'
    data: accesstoken: token
    method: 'get'
    contentType: 'application/json'
    success: (data) ->
      cb data.data.hasnot_read_messages
    error: (_error) ->
      console.log 'error', _error

exports.markAll = (token, cb) ->
  reqwest
    url: configs.domain + '/api/v1/message/mark_all'
    type: 'json'
    data: JSON.stringify(accesstoken: token)
    method: 'post'
    contentType: 'application/json'
    success: (data) ->
      cb data
    error: (_error2) ->
      console.log 'error', _error2
