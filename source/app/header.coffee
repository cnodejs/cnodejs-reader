
React = require 'react'

$ = React.DOM

module.exports = React.createClass
  displayName: 'app-header'

  render: ->
    $.div className: 'app-header', 'app-header'