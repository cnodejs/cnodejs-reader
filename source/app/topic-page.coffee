
React = require 'react'
Router = require 'react-router'
superagent = require 'superagent'

$ = React.DOM
Navigation = Router.Navigation
config = require '../config'
Loading = require '../module/loading'
TopicCard = require './topic-card'
Editor = require '../module/editor'
Hint = require '../module/hint'
Comment = require './comment'

module.exports = React.createFactory React.createClass
  displayName: 'topic-page'
  mixins: [Navigation]

  getInitialState: ->
    data: undefined
    loading: 'ease'
    reply: ''
    error: null

  componentDidMount: ->
    @loadTopic()

  loadTopic: ->
    @setState loading: 'busy'
    superagent
    .get "#{config.host}/topic/#{@props.params.topicid}"
    .end (res) =>
      if res.ok
        data = res.body.data
        @setState {data, loading: 'ease', reply: ''}
      else
        @setState loading: 'ease', reply: ''

  onReplySubmit: ->
    superagent
    .post "#{config.host}/topic/#{@props.params.topicid}/replies"
    .send accesstoken: @props.token
    .send content: @state.reply
    .end (res) =>
      if res.ok
        @loadTopic()
      else
        @setState error: res.body.error_msg

  onReplyChange: (text) ->
    @setState reply: text, error: null

  renderComments: (comments) ->
    comments.map (comment, index) =>
      Comment key: index, data: comment

  render: ->
    $.div className: 'topic-page',
      if @state.data?
        $.div className: 'wrap divide',
          TopicCard data: @state.data
          @renderComments @state.data.replies
          if @props.user?
            $.div className: 'reply',
              Editor text: @state.reply, onTextChange: @onReplyChange
              if @state.error?
                Hint mode: 'error', data: @state.error
              $.div className: 'button', onClick: @onReplySubmit, 'Reply'
          else
            Hint mode: 'info', data: 'Login to reply'
      Loading data: @state.loading