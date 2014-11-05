
React = require 'react'
Router = require 'react-router'

$ = React.DOM
Navigation = Router.Navigation

module.exports = React.createFactory React.createClass
  displayName: 'topic-title'

  mixins: [Navigation]

  onTopicClick: ->
    @transitionTo 'topic', topicid: @props.data.id

  render: ->
    $.div
      className: 'topic-title'
      onClick: @onTopicClick
      $.div
        className: 'avatar'
        title: @props.data.author.loginname
        style:
          backgroundImage: "url('#{@props.data.author.avatar_url}')"
      $.span className: 'title', @props.data.title