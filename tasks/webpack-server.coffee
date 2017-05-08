'use strict'
fs = require('fs')
webpack = require('webpack')
nodeModules = {}
fs.readdirSync('node_modules').filter((x) ->
  [ '.bin' ].indexOf(x) == -1
).forEach (mod) ->
  nodeModules[mod] = 'commonjs ' + mod
module.exports =
  entry: [
    'webpack/hot/poll?1000'
    './src/server'
  ]
  target: 'node'
  output:
    path: 'build/'
    filename: 'bundle.js'
  externals: nodeModules
  module: loaders: [ {
    test: /\.coffee/
    loader: 'coffee-loader'
  } ]
  plugins: [ new (webpack.HotModuleReplacementPlugin) ]
  resolve: extensions: [
    '.js'
    ''
    '.coffee'
  ]
  plugins: [ new (webpack.HotModuleReplacementPlugin) ]
