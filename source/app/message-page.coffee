
React = require 'react'

$ = React.DOM

module.exports = React.createFactory React.createClass
  displayName: 'message-page'

  render: ->
    $.div className: 'message-page',
      'message-page'