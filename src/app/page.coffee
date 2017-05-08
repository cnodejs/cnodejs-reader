'use strict'
React = require('react')
keycode = require('keycode')
Immutable = require('immutable')
routes = require('../routes')
controller = require('../controller')
Reader = React.createFactory(require('./reader'))
Devtools = React.createFactory(require('actions-recorder/lib/devtools'))
Addressbar = React.createFactory(require('router-view'))
div = React.DOM.div
module.exports = React.createClass(
  displayName: 'app-page'
  propTypes: core: React.PropTypes.instanceOf(Immutable.Map).isRequired
  getInitialState: ->
    {
      showDevtools: false
      path: Immutable.List()
    }
  componentDidMount: ->
    window.addEventListener 'keydown', @onWindowKeydown
    window.addEventListener 'resize', @onResize
  componentWillUnmount: ->
    window.removeEventListener 'keydown', @onWindowKeydown
    window.removeEventListener 'resize', @onResize
  isLoading: ->
    store = @props.core.get('store')
    store.getIn [
      'device'
      'isLoading'
    ]
  onResize: ->
    @forceUpdate()
  onWindowKeydown: (event) ->
    if keycode(event.keyCode) == 'a' and event.shiftKey and (event.metaKey or event.ctrlKey)
      @setState showDevtools: !@state.showDevtools

  onPopstate: (info) ->
    if !@isLoading()
      controller.routerGo info

  onPathChange: (path) ->
    @setState path: path
  renderDevtools: ->
    div { style: @styleDevtools() }, Devtools(
      core: @props.core
      width: 400
      height: window.innerHeight
      path: @state.path
      onPathChange: @onPathChange)
  render: ->
    store = @props.core.get('store')
    loginname = store.getIn([
      'device'
      'loginname'
    ])
    div { style: @styleRoot() },
      Reader
        store: store
        isLogined: loginname
      if @state.showDevtools then @renderDevtools() else undefined
      Addressbar
        route: store.get('router')
        rules: routes
        onPopstate: @onPopstate
        skipRendering: @isLoading()
        inHash: true
  styleRoot: ->
    {
      position: 'absolute'
      width: '100%'
      height: '100%'
    }
  styleDevtools: ->
    {
      position: 'fixed'
      right: 0
      top: 0
      width: window.innerWidth
      height: window.innerHeight
    }
)
