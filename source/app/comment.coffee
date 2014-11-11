
React = require 'react'
markedReact = require 'marked'

$ = React.DOM

UserCard = require './user-card'
Time = require '../module/time'

markedReact.setOptions
  gfm: yes
  breaks: yes

module.exports = React.createFactory React.createClass
  displayName: 'app-comment'

  render: ->
    $.div className: 'app-comment pad',
      $.div
        className: 'content article-preview',
        markedReact @props.data.content
      $.div className: 'line author',
        UserCard data: @props.data.author
        Time data: @props.data.create_at