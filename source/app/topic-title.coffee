
React = require 'react'

$ = React.DOM

module.exports = React.createClass
  displayName: 'topic-title'

  render: ->
    $.div className: 'topic-title',
      $.div
        className: 'avatar'
        title: @props.data.author.loginname
        style:
          backgroundImage: "url('#{@props.data.author.avatar_url}')"
      $.span className: 'title', @props.data.title