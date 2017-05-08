'use strict'
React = require('react')
ReactDOM = require('react-dom')
recorder = require('actions-recorder')
pathUtil = require('router-view/lib/path')
require '../style/main.css'
routes = require('./routes')
schema = require('./schema')
updater = require('./updater')
controller = require('./controller')
Page = React.createFactory(require('./app/page'))
oldAddress = location.hash.substr(1)
router = pathUtil.getCurrentInfo(routes, oldAddress)
recorder.setup
  initial: schema.store
  updater: updater

render = (core) ->
  ReactDOM.render Page(core: core), document.querySelector('#app')

recorder.request render
recorder.subscribe render
if module.hot
  module.hot.accept [
    './schema'
    './updater'
  ], ->
    `var schema`
    `var updater`
    schema = require('./schema')
    updater = require('./updater')
    recorder.hotSetup
      initial: schema.store
      updater: updater
  module.hot.accept './controller', ->
  module.hot.accept './app/page', ->
    Page = React.createFactory(require('./app/page'))
    recorder.request render
controller.start()
if router.get('name') == 'topic'
  controller.routerTopic router.getIn([
    'data'
    'id'
  ])
