
React = require 'react'

$ = React.DOM

UserCard = require './user-card'
TopicTitle = require './topic-title'
Comment = require './comment'
Hint = require '../module/hint'

module.exports = React.createFactory React.createClass
  displayName: 'message-page'

  renderMessages: (messages) ->
    messages.map (message, index) =>
      # force set avatar...
      message.topic.author = message.author
      message.reply.author = message.author
      $.div key: index, className: 'message-item pad',
        Hint mode: 'info', data: message.type
        TopicTitle data: message.topic
        if message.reply.id?
          Comment data: message.reply

  onClearClick: ->
    @props.clearMessages()

  render: ->
    $.div className: 'message-page divide',
      @renderMessages @props.messages
      if @props.messages.length > 0
        $.div
          className: 'button is-danger'
          onClick: @onClearClick
          "清除未读"
      else
        Hint mode: 'info', data: '没有未读消息'