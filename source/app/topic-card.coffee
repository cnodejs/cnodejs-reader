
React = require 'react'
markedReact = require 'marked'

$ = React.DOM
UserCard = require './user-card'

markedReact.setOptions
  gfm: yes
  breaks: yes

module.exports = React.createFactory React.createClass
  displayName: 'topic-card'

  render: ->
    $.div className: 'topic-card pad',
      $.div className: 'title', @props.data.title
      UserCard data: @props.data.author
      $.div
        className: 'content article-preview',
        markedReact @props.data.content