
React = require 'react'

$ = React.DOM

module.exports = React.createFactory React.createClass
  displayName: 'app-comment'

  render: ->
    $.div className: 'app-comment',
      'app-comment'