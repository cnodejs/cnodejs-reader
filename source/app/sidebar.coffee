
React = require 'react'
request = require 'superagent'
Router = require 'react-router'

config = require '../config'

$ = React.DOM
Navigation = Router.Navigation

Olverlay = require '../module/overlay'

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

  render: ->
    $.div className: 'app-sidebar',
      $.nav className: 'nav',
        $.div className: 'home', onClick: @onHomeClick, 'Home'
        $.div className: 'post', onClick: @onPostClick, 'Post'
      if @props.user?
        $.div className: 'bottom',
          $.span className: 'username', @props.user
          $.span
            className: 'button'
            onClick: @logout
            'Logout'
      else
        $.div className: 'account',
          $.div className: 'button', onClick: @openLogin, 'Login'
          if @state.openBox
            Olverlay onRemove: @hideBox,
              $.div className: 'line', 'Copy your token from CNode:'
              $.input ref: 'token', className: 'token', placeholder: 'Paste token'
              $.div
                className: 'button'
                onClick: @checkToken
                onKeyDown: @onTokenKeydown
                'Submit'