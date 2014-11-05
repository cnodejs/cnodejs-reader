
React = require 'react'

$ = React.DOM

module.exports = React.createFactory React.createClass
  displayName: 'module-editor'

  propTypes: ->
    onTextChange: React.PropTypes.func
    text: React.PropTypes.string

  onTextChange: (event) ->
    text = event.target.value
    @setState {text}
    @props.onTextChange text

  render: ->
    $.div className: 'module-editor',
      $.textarea className: 'text', onChange: @onTextChange, value: @props.text
      $.div className: 'preview', @props.text