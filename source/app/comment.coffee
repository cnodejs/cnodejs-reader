
React = require 'react'

$ = React.DOM

UserCard = require './user-card'
Time = require '../module/time'

module.exports = React.createFactory React.createClass
  displayName: 'app-comment'

  render: ->
    $.div className: 'app-comment',
      UserCard data: @props.data.author
      Time data: @props.data.create_at
      $.div
        className: 'content',
        dangerouslySetInnerHTML:
          __html: @props.data.content