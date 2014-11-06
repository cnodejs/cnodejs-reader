
React = require 'react'
request = require 'superagent'
Router = require 'react-router'

$ = React.DOM
Navigation = Router.Navigation

config = require '../config'
Olverlay = require '../module/overlay'
UserCard = require './user-card'

module.exports = React.createFactory React.createClass
  displayName: 'app-sidebar'
  mixins: [Navigation]

  getInitialState: ->
    openBox: no

  logout: ->
    @props.logout()

  openLogin: ->
    @setState openBox: yes

  hideBox: ->
    @setState openBox: no

  componentDidMount: ->
    if @props.token?
      @auth @props.token

  checkToken: (event) ->
    token = @refs.token.getDOMNode().value
    @auth token

  auth: (token) ->
    request
    .post "#{config.host}/accesstoken"
    .send accesstoken: token
    .end (res) =>
      if res.ok
        @props.login res.body.loginname, token

  onTokenKeydown: (event) ->
    if event.keyCode is 13
      @checkToken()

  onHomeClick: ->
    @transitionTo '/'

  onPostClick: ->
    @transitionTo 'post'

  onBackClick: ->
    @goBack()

  onMessageClick: ->
    @transitionTo 'messages'

  render: ->
    n = @props.messages.length
    $.div className: 'app-sidebar',
      $.nav className: 'nav',
        $.div className: 'line pad',
          $.span className: 'button', onClick: @onHomeClick, 'Home'
        $.div className: 'line pad',
          $.span className: 'button', onClick: @onBackClick, 'Back'
        $.div className: 'line pad',
          $.span className: 'button', onClick: @onPostClick, 'Post'
        if n > 0
          $.div className: 'line pad',
            $.span className: 'button is-important', onClick: @onMessageClick, n
      if @props.user?
        $.div className: 'bottom line pad',
          UserCard
            data:
              loginname: @props.user
              avatar_url: null
          $.span
            className: 'button'
            onClick: @logout
            'Logout'
      else
        $.div className: 'account pad',
          $.div className: 'button', onClick: @openLogin, 'Login'
          if @state.openBox
            Olverlay onRemove: @hideBox,
              $.div className: 'line', 'Copy your token from CNode:'
              $.div className: 'line',
                $.input ref: 'token', className: 'token', placeholder: 'Paste token'
                $.div
                  className: 'button'
                  onClick: @checkToken
                  onKeyDown: @onTokenKeydown
                  'Submit'