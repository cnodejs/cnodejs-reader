
React = require 'react'
superagent = require 'superagent'

$ = React.DOM
Sidebar = require './sidebar'
key = 'cnodejs-reader-token'

config = require '../config'

module.exports = React.createFactory React.createClass
  displayName: 'app-page'

  getInitialState: ->
    token: localStorage.getItem(key)
    user: null
    avatar: null
    view: 'topics' # 'topic', 'user', 'edit'
    id: null
    messages: []

  componentDidMount: ->
    @checkMessages()

  clearMessages: ->
    superagent
    .post "#{config.host}/message/mark_all"
    .send accesstoken: @state.token
    .end (res) =>
      if res.ok
        @setState messages: []

  checkMessages: ->
    superagent
    .get "#{config.host}/messages"
    .query accesstoken: @state.token
    .end (res) =>
      if res.ok
        setTimeout @checkMessages, 60000
        @setState messages: res.body.data.hasnot_read_messages

  login: (user, token, avatar) ->
    @setState {token, user, avatar}
    @checkMessages()
    localStorage.setItem key, token

  logout: ->
    @setState token: null, user: null, avatar: null
    localStorage.setItem key, null

  render: ->

    $.div className: 'app-page',
      Sidebar
        user: @state.user
        token: @state.token
        avatar: @state.avatar
        login: @login
        logout: @logout
        messages: @state.messages
        clearMessages: @clearMessages
      @props.activeRouteHandler
        user: @state.user
        token: @state.token
        messages: @state.messages
        clearMessages: @clearMessages