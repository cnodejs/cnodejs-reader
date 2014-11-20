
React = require 'react'
Router = require 'react-router'
superagent = require 'superagent'

Sidebar = require './sidebar'
key = 'cnodejs-reader-token'

config = require '../config'
TopicList = require './topic-list'

$ = React.DOM
Navigation = Router.Navigation

module.exports = React.createFactory React.createClass
  displayName: 'app-page'
  mixins: [Navigation]

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

  onClosePop: ->
    @transitionTo '/'

  render: ->
    handlerComponent = @props.activeRouteHandler
      user: @state.user
      token: @state.token
      messages: @state.messages
      clearMessages: @clearMessages

    $.div className: 'app-page',
      TopicList
        user: @state.user
        token: @state.token
        messages: @state.messages
        clearMessages: @clearMessages
      Sidebar
        user: @state.user
        token: @state.token
        avatar: @state.avatar
        login: @login
        logout: @logout
        messages: @state.messages
        clearMessages: @clearMessages
      if handlerComponent
        $.div className: 'cover-page',
          $.div className: 'close', onClick: @onClosePop, '×'
          handlerComponent