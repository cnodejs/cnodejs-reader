
React = require 'react'

$ = React.DOM
UserCard = require './user-card'

module.exports = React.createFactory React.createClass
  displayName: 'topic-card'

  render: ->
    $.div className: 'topic-card pad',
      $.div className: 'title', @props.data.title
      UserCard data: @props.data.author
      $.div
        className: 'content article-preview',
        dangerouslySetInnerHTML:
          __html: @props.data.content