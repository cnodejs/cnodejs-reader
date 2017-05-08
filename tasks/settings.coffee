'use strict'

exports.get = (env) ->
  do ->
    switch env
      when 'dev'
        return {
          env: 'dev'
          host: 'http://localhost'
          port: 8080
        }
      when 'build'
        return {
          env: 'build'
          host: 'http://localhost'
          port: 8080
        }
    return
