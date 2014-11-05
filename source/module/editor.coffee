
React = require 'react'

$ = React.DOM

module.exports = React.createFactory React.createClass
  displayName: 'module-editor'

  getInitialState: ->
    text: ''

  propTypes: ->
    onSubmit: React.PropTypes.func

  onTextChange: (event) ->
    text = event.target.value
    @setState {text}

  onSubmit: ->
    @propTypes.onSubmit @state.text, =>
      @setState text: ''

  render: ->
    $.div className: 'module-editor',
      $.textarea className: 'text', onChange: @onTextChange, value: @state.text
      $.div className: 'preview', @state.text
      $.div className: 'button', onClick: @onSubmit, 'Submit'