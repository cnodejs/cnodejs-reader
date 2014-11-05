
React = require 'react'
$ = React.DOM

Sidebar = require './sidebar'
key = 'cnodejs-reader-token'

module.exports = React.createFactory React.createClass
  displayName: 'app-page'

  getInitialState: ->
    token: localStorage.getItem(key)
    user: null
    view: 'topics' # 'topic', 'user', 'edit'
    id: null

  login: (user, token) ->
    @setState {token, user}
    localStorage.setItem key, token

  logout: ->
    @setState token: null, user: null
    localStorage.setItem key, null

  render: ->

    $.div className: 'app-page',
      Sidebar
        user: @state.user
        token: @state.token
        login: @login
        logout: @logout
      @props.activeRouteHandler()