
React = require 'react'
markedReact = require 'marked'
Router = require 'react-router'

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
      $.div className: 'line',
        $.a onClick: @onTabClick, className: 'nav-tab',
          Hint mode: 'info', data: @props.data.tab
      $.div
        className: 'content article-preview',
        markedReact @props.data.content
      $.div className: 'author',
        UserCard data: @props.data.author