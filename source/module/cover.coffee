
React = require 'react'

$ = React.DOM

module.exports = React.createClass
  displayName: 'module-cover'

  render: ->
    $.div className: 'module-cover',
      $.div className: 'card',
        @props.children