
React = require 'react'

$ = React.DOM

module.exports = React.createFactory React.createClass
  displayName: 'topic-page'

  render: ->
    $.div className: 'topic-page',
      'topic-page'