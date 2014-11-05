
React = require 'react'
Router = require 'react-router'

$ = React.DOM
Navigation = Router.Navigation

module.exports = React.createFactory React.createClass
  displayName: 'topic-title'

  mixins: [Navigation]

  onTopicClick: ->
    @transitionTo 'topic', topicid: @props.data.id

  onAvatarClick: ->
    @transitionTo 'user', userid: @props.data.author.loginname

  render: ->
    $.div
      className: 'topic-title'
      $.div
        className: 'avatar'
        title: @props.data.author.loginname
        onClick: @onAvatarClick
        style:
          backgroundImage: "url('#{@props.data.author.avatar_url}')"
      $.span
        className: 'title'
        onClick: @onTopicClick
        @props.data.title