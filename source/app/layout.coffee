
React = require 'react'
$ = React.DOM

Header = require './header'
TopicList = require './topic-list'

module.exports = React.createClass
  displayName: 'app-layout'

  getInitialState: ->
    logined: no
    token: null
    user: null

  login: (user, token) ->
    @setState {logined: yes, token, user}

  logout: ->
    @setState logined: no, token: null, user: null

  render: ->

    $.div className: 'app-layout',
      Header
        logined: @state.logined
        user: @state.user
        token: @state.token
        login: @login
        logout: @logout
      TopicList {}