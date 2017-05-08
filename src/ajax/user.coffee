'use strict'
reqwest = require('reqwest')
configs = require('../configs')

exports.get = (loginname, token, cb) ->
  reqwest
    url: configs.domain + '/api/v1/user/' + loginname
    type: 'json'
    data: accesstoken: token
    method: 'get'
    contentType: 'application/json'
    success: (data) ->
      cb data.data
    error: (_error) ->
      console.log 'error', _error

exports.accesstoken = (token, cb) ->
  reqwest
    url: configs.domain + '/api/v1/accesstoken'
    data: JSON.stringify(accesstoken: token)
    type: 'json'
    method: 'post'
    contentType: 'application/json'
    success: (data) ->
      cb data.loginname
    error: (_error2) ->
      console.log 'error', _error2
