
React = require 'react'

$ = React.DOM

module.exports = React.createClass
  displayName: 'module-loading'

  render: ->
    $.div className: 'module-loading',
      'loading'