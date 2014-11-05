
React = require 'react'
Router = require 'react-router'
superagent = require 'superagent'

$ = React.DOM
Navigation = Router.Navigation
config = require '../config'
Loading = require '../module/loading'
TopicCard = require './topic-card'
Editor = require '../module/editor'
Comment = require './comment'

module.exports = React.createFactory React.createClass
  displayName: 'topic-page'
  mixins: [Navigation]

  getInitialState: ->
    data: undefined
    loading: 'ease'
    reply: ''

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

  onReplyChange: (text) ->
    @setState reply: text

  renderComments: (comments) ->
    comments.map (comment, index) =>
      Comment key: index, data: comment

  render: ->
    $.div className: 'topic-page',
      Loading data: @state.loading
      if @state.data?
        $.div className: 'wrap',
          TopicCard data: @state.data
          @renderComments @state.data.replies
      if @props.user? and @state.data?
        $.div className: 'reply',
          Editor text: @state.reply, onTextChange: @onReplyChange
          $.div className: 'button', onClick: @onReplySubmit, 'Reply'