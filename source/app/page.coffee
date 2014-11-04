
React = require 'react'
$ = React.DOM

Header = require './header'
key = 'cnodejs-reader-token'

module.exports = React.createFactory React.createClass
  displayName: 'app-page'

  getInitialState: ->
    logined: no
    token: localStorage.getItem(key)
    user: null
    view: 'topics' # 'topic', 'user', 'edit'
    id: null

  login: (user, token) ->
    @setState {logined: yes, token, user}
    localStorage.setItem key, token

  logout: ->
    @setState logined: no, token: null, user: null
    localStorage.setItem key, null

  render: ->

    $.div className: 'app-page',
      Header
        logined: @state.logined
        user: @state.user
        token: @state.token
        login: @login
        logout: @logout
      @props.activeRouteHandler()