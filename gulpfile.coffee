'use strict'
fs = require('fs')
gulp = require('gulp')
gutil = require('gulp-util')
sequence = require('run-sequence')
settings = require('./tasks/settings')
env = 'dev'

gulp.task 'html', (cb) ->
  `var fs`
  html = require('./tasks/template')
  fs = require('fs')
  fs.writeFile 'build/index.html', html(env), cb

gulp.task 'del', (cb) ->
  del = require('del')
  del [ 'build/**/*' ], cb

gulp.task 'webpack-build', (cb) ->
  webpack = require('webpack')
  webpackBuild = require('./tasks/webpack-build')
  config = settings.get(env)
  info =
    __dirname: __dirname
    isMinified: config.isMinified
    useCDN: config.useCDN
    cdn: config.cdn
    env: config.env
  webpack webpackBuild(info), (err, stats) ->
    if err
      throw new (gutil.PluginError)('webpack', err)
    gutil.log '[webpack]', stats.toString()
    jsonData = stats.toJson()
    fileContent = JSON.stringify(jsonData.assetsByChunkName)
    fs.writeFileSync 'tasks/assets.json', fileContent
    cb()

gulp.task 'webpack-server', (cb) ->
  webpack = require('webpack')
  serverConfig = require('./tasks/webpack-server')
  webpack(serverConfig).run (err, stats) ->
    if err
      console.log err
    else
      console.log stats.toString()
    cb()
  webpack(serverConfig).watch 100, (err, stats) ->
    if err
      console.log err
    else
      console.log stats.toString()

gulp.task 'dev', (cb) ->
  sequence 'html', 'webpack-dev', cb

gulp.task 'build', (cb) ->
  env = 'build'
  sequence 'del', 'webpack-build', 'html', cb
