
React = require 'react'

$ = React.DOM

module.exports = React.createFactory React.createClass
  displayName: 'module-overlay'

  propTypes:
    onRemove: React.PropTypes.func

  getDefaultProps: ->
    onRemove: ->
      console.log 'remove overlay'

  onOverlayClick: (event) ->
    if event.target.className is 'module-overlay'
      @props.onRemove()

  render: ->
    $.div
      className: 'module-overlay',
      onClick: @onOverlayClick
      $.div className: 'card',
        @props.children