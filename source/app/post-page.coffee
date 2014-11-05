
React = require 'react'

$ = React.DOM

module.exports = React.createFactory React.createClass
  displayName: 'post-page'

  render: ->
    $.div className: 'post-page',
      'post-page'