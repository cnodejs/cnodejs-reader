
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
        @props.login res.body.loginname, token, res.body.avatar_url

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
          $.span className: 'button', onClick: @onHomeClick, '主页'
        $.div className: 'line pad',
          $.span className: 'button', onClick: @onBackClick, '后退'
        $.div className: 'line pad',
          $.span className: 'button', onClick: @onPostClick, '发布'
        if n > 0
          $.div className: 'line pad',
            $.span className: 'button is-important', onClick: @onMessageClick, n
      if @props.user?
        $.div className: 'bottom line pad',
          UserCard
            data:
              loginname: @props.user
              avatar_url: @props.avatar
          $.span
            className: 'button'
            onClick: @logout
            '登出'
      else
        $.div className: 'account pad',
          $.div className: 'button', onClick: @openLogin, '登录'
          if @state.openBox
            Olverlay onRemove: @hideBox,
              $.div className: 'line', '使用 CNode 的 token 验证:'
              $.div className: 'line',
                $.input ref: 'token', className: 'token', placeholder: '粘贴 token'
                $.div
                  className: 'button'
                  onClick: @checkToken
                  onKeyDown: @onTokenKeydown
                  '提交'