
React = require 'react'

$ = React.DOM

module.exports = React.createFactory React.createClass
  displayName: 'module-loading'

  render: ->
    $.div className: 'module-loading',
      'loading'