
React = require 'react'
superagent = require 'superagent'
Router = require 'react-router'

$ = React.DOM
Navigation = Router.Navigation

Editor = require '../module/editor'
config = require '../config'

module.exports = React.createFactory React.createClass
  displayName: 'post-page'
  mixins: [Navigation]

  getInitialState: ->
    tab: 'share'
    title: ''
    content: ''

  onTitleChange: (event) ->
    text = event.target.value
    @setState title: text

  onContentChange: (text) ->
    @setState content: text

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

  render: ->
    if @props.user?
      $.div className: 'post-page',
        $.input className: 'title', onChange: @onTitleChange, value: @state.title
        Editor text: @state.content, onTextChange: @onContentChange
        $.span className: 'button', onClick: @onSubmitClick, 'Submit'
    else
      $.div className: 'post-page', 'Login to post'