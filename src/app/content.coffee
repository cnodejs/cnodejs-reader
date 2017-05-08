'use strict'
React = require('react')
hljs = require('highlight.js')
Remarkable = React.createFactory(require('react-remarkable'))
reset = require('../util/reset')
options = 
  breaks: true
  html: true
  linkify: true
  highlight: (code, lang) ->
    result = hljs.highlightAuto(code)
    result.value
div = React.DOM.div
module.exports = React.createClass(
  displayName: 'app-content'
  propTypes: text: React.PropTypes.string.isRequired
  render: ->
    div {
      className: 'markdown-content'
      style: @styleRoot()
    }, Remarkable(
      source: @props.text
      options: options)
  styleRoot: ->
    {
      fontFamily: reset.contentFonts
      fontSize: '15px'
      lineHeight: '1.8em'
    }
)
