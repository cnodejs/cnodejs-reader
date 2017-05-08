'use strict'
path = require('path')
webpack = require('webpack')
ExtractTextPlugin = require('extract-text-webpack-plugin')

module.exports = (info) ->
  {
    entry:
      main: [ './src/main' ]
      vendor: []
    output:
      path: path.join(info.__dirname, 'build/')
      filename: '[name].[chunkhash:8].js'
    resolve: extensions: [
      '.js'
      '.coffee'
      ''
    ]
    module: loaders: [
      {
        test: /\.coffee$/
        loader: 'coffee-loader'
        ignore: /node_modules/
      }
      {
        test: /.(png|jpg)$/
        loader: 'url-loader'
        query: limit: 100
      }
      {
        test: /\.css$/
        loader: ExtractTextPlugin.extract('style-loader', 'css!autoprefixer')
      }
    ]
    plugins: [
      new (webpack.optimize.CommonsChunkPlugin)('vendor', 'vendor.[chunkhash:8].js')
      new ExtractTextPlugin('style.[chunkhash:8].css')
      new (webpack.optimize.UglifyJsPlugin)(sourceMap: false)
    ]
  }
