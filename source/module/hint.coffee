
React = require 'react'

$ = React.DOM

module.exports = React.createFactory React.createClass
  displayName: 'module-hint'

  propTypes:
    mode: React.PropTypes.string
    # 'error', 'warning', 'empty', 'success', 'info'
    data: React.PropTypes.string

  render: ->
    $.div className: "module-hint is-#{@props.mode}",
      unless @props.mode is 'empty' then @props.data