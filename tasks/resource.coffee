'use strict'

call = (f) ->
  f()

exports.get = (config) ->
  do ->
    switch config.env
      when 'dev'
        return {
          vendor: config.host + ':' + config.port + '/vendor.js'
          main: config.host + ':' + config.port + '/main.js'
          style: null
        }
      when 'build'
        return call(->
          assets = require('./assets')
          {
            main: assets.main[0]
            vendor: assets.vendor
            style: assets.main[1]
          }
        )
    return
