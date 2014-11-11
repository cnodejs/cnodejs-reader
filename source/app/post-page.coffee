
React = require 'react'
superagent = require 'superagent'
Router = require 'react-router'

$ = React.DOM
Navigation = Router.Navigation

Editor = require '../module/editor'
config = require '../config'
Select = require '../module/select'
Hint = require '../module/hint'

module.exports = React.createFactory React.createClass
  displayName: 'post-page'
  mixins: [Navigation]

  getInitialState: ->
    tab: 'share'
    title: ''
    content: ''
    error: null

  onTitleChange: (event) ->
    text = event.target.value
    @setState title: text, error: null

  onContentChange: (text) ->
    @setState content: text, error: null

  onSubmitClick: ->
    superagent
    .post "#{config.host}/topics"
    .send accesstoken: @props.token
    .send title: @state.title
    .send content: @state.content
    .send tab: @state.tab
    .end (res) =>
      if res.ok
        @transitionTo 'topic', topicid: res.body.topic_id
      else
        @setState error: res.body.error_msg

  onTabClick: (tab) ->
    @setState tab: tab

  render: ->
    if @props.user?
      $.div className: 'post-page paragraph',
        Select
          chosen: @state.tab
          data: ['share', 'ask', 'job']
          onItemClick: @onTabClick
          locale: config.tabLocale
        $.input className: 'title', onChange: @onTitleChange, value: @state.title
        Editor text: @state.content, onTextChange: @onContentChange
        if @state.error?
          Hint mode: 'error', data: @state.error
        $.span className: 'button', onClick: @onSubmitClick, '提交'
    else
      $.div className: 'post-page',
        Hint mode: 'info', data: '登录以后才能发布文章'