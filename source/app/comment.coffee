
React = require 'react'

$ = React.DOM

UserCard = require './user-card'
Time = require '../module/time'

module.exports = React.createFactory React.createClass
  displayName: 'app-comment'

  render: ->
    $.div className: 'app-comment pad',
      $.div className: 'line',
        UserCard data: @props.data.author
        Time data: @props.data.create_at
      $.div
        className: 'content article-preview',
        dangerouslySetInnerHTML:
          __html: @props.data.content.replace(/\n/g, '<br>')