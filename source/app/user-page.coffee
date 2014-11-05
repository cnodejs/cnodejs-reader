
React = require 'react'

$ = React.DOM

module.exports = React.createFactory React.createClass
  displayName: 'user-page'

  render: ->
    $.div className: 'user-page',
      'user-page'