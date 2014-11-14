
React = require 'react'
markedReact = require 'marked'
Router = require 'react-router'

config = require '../config'

$ = React.DOM
UserCard = require './user-card'
Hint = require '../module/hint'
Time = require '../module/time'
Navigation = Router.Navigation

markedReact.setOptions
  gfm: yes
  breaks: yes

module.exports = React.createFactory React.createClass
  displayName: 'topic-card'
  mixins: [Navigation]

  onTabClick: ->
    @transitionTo '/', {}, tab: @props.data.tab

  render: ->
    track = "#{@props.data.reply_count} / #{@props.data.visit_count}"

    $.div className: 'topic-card pad',
      $.div className: 'title line',
        @props.data.title
      $.div className: 'line nav-tab',
        $.a onClick: @onTabClick,
          Hint mode: 'info', data: config.tabLocale[@props.data.tab]
        Hint mode: 'info', data: track
      $.div
        className: 'content article-preview',
        markedReact @props.data.content
      $.div className: 'author line',
        UserCard data: @props.data.author
        Time data: @props.data.create_at