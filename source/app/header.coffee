
React = require 'react'
request = require 'superagent'

config = require '../config'

$ = React.DOM
Cover = require '../module/cover'

module.exports = React.createFactory React.createClass
  displayName: 'app-header'

  getInitialState: ->
    openBox: no

  logout: ->
    @props.logout()

  openLogin: ->
    @setState openBox: yes

  hideBox: ->
    @setState openBox: no

  checkToken: (event) ->
    token = @refs.token.getDOMNode().value
    request
    .post "#{config.host}/accesstoken"
    .send accesstoken: token
    .end (res) =>
      if res.ok
        console.log res.body

  render: ->
    if @props.logined
      $.div className: 'app-header',
        $.div className: 'username', @props.user
        $.div
          className: 'button'
          onClick: @logout
          'Logout'
    else
      $.div className: 'app-header',
        $.div
          className: 'button'
          onClick: @openLogin
          'Login'
        if @state.openBox
          Cover {},
            $.div className: 'line', 'Copy your token from CNode:'
            $.input ref: 'token', className: 'token', placeholder: 'Paste token'
            $.div
              className: 'button'
              onClick: @checkToken
              'Submit'