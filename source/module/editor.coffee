
React = require 'react'
markedReact = require 'marked'

window.React = React
$ = React.DOM

markedReact.setOptions
  gfm: yes
  breaks: yes

module.exports = React.createFactory React.createClass
  displayName: 'module-editor'

  propTypes: ->
    onTextChange: React.PropTypes.func
    text: React.PropTypes.string

  onTextChange: (event) ->
    text = event.target.value
    @props.onTextChange text

  render: ->
    $.div className: 'module-editor',
      $.textarea className: 'text', onChange: @onTextChange, value: @props.text
      $.div className: 'preview',
        markedReact @props.text