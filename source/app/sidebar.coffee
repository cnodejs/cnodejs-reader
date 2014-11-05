
React = require 'react'
request = require 'superagent'

config = require '../config'

$ = React.DOM

Olverlay = require '../module/overlay'

module.exports = React.createFactory React.createClass
  displayName: 'app-sidebar'

  getInitialState: ->
    openBox: no

  logout: ->
    @props.logout()

  openLogin: ->
    @setState openBox: yes

  hideBox: ->
    @setState openBox: no

  componentDidMount: ->
    console.log @props.token
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

  render: ->
    if @props.user?
      $.div className: 'app-sidebar',
        $.div className: 'username', @props.user
        $.div
          className: 'button'
          onClick: @logout
          'Logout'
    else
      $.div className: 'app-sidebar',
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