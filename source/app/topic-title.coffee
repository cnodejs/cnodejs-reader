
React = require 'react'
Router = require 'react-router'

$ = React.DOM
Navigation = Router.Navigation
Time = require '../module/time'
Hint = require '../module/hint'

module.exports = React.createFactory React.createClass
  displayName: 'topic-title'

  mixins: [Navigation]

  onTopicClick: ->
    @transitionTo 'topic', topicid: @props.data.id

  onAvatarClick: ->
    @transitionTo 'user', userid: @props.data.author.loginname

  render: ->
    track = if @props.data.reply_count?
      "#{@props.data.reply_count} / #{@props.data.visit_count}"
    else undefined

    $.div
      className: 'topic-title line'
      $.div
        className: 'avatar'
        title: @props.data.author.loginname
        onClick: @onAvatarClick
        style:
          backgroundImage: "url('#{@props.data.author.avatar_url}')"
      $.a
        href: "#/topic/#{@props.data.id}"
        className: 'title'
        onClick: @onTopicClick
        @props.data.title
      if @props.data.create_at?
        Time data: @props.data.create_at
      if track?
        Hint mode: 'info', data: track