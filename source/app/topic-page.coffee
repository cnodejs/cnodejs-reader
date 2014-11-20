
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
    @loadTopic @props.params.topicid

  componentWillReceiveProps: (props, state) ->
    if props.params.topicid isnt @props.params.topicid
      @loadTopic props.params.topicid

  loadTopic: (topicid) ->
    @setState loading: 'busy'
    superagent
    .get "#{config.host}/topic/#{topicid}"
    .query mdrender: no
    .end (res) =>
      if res.ok
        data = res.body.data
        @setState {data, loading: 'ease', reply: ''}
        @refs.root.getDOMNode().parentElement.scrollTop = 0
      else
        @setState loading: 'ease', reply: ''

  onReplySubmit: ->
    superagent
    .post "#{config.host}/topic/#{@props.params.topicid}/replies"
    .send accesstoken: @props.token
    .send content: @state.reply
    .end (res) =>
      if res.ok
        @loadTopic @props.params.topicid
      else
        @setState error: res.body.error_msg

  onReplyChange: (text) ->
    @setState reply: text, error: null

  renderComments: (comments) ->
    comments.map (comment, index) =>
      Comment key: index, data: comment

  render: ->
    $.div ref: 'root', className: 'topic-page',
      if @state.data? and (@state.loading is 'ease')
        $.div className: 'wrap',
          TopicCard data: @state.data
          @renderComments @state.data.replies
          if @props.user?
            $.div className: 'reply pad paragraph',
              Editor text: @state.reply, onTextChange: @onReplyChange
              $.div className: 'line',
                if @state.error?
                  Hint mode: 'error', data: @state.error
                if @state.loading is 'ease'
                  $.div className: 'button', onClick: @onReplySubmit, '回复'
          else
            Hint mode: 'info', data: '登录后才能回复'
      Loading data: @state.loading