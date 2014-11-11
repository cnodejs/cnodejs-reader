
React = require 'react'
markedReact = require 'marked'
Router = require 'react-router'

config = require '../config'

$ = React.DOM
UserCard = require './user-card'
Hint = require '../module/hint'
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
    $.div className: 'topic-card pad',
      $.div className: 'title', @props.data.title
      $.div className: 'line nav-tab',
        $.a onClick: @onTabClick,
          Hint mode: 'info', data: config.tabLocale[@props.data.tab]
      $.div
        className: 'content article-preview',
        markedReact @props.data.content
      $.div className: 'author',
        UserCard data: @props.data.author