'use strict'
hsl = require('hsl')
React = require('react')
reset = require('../util/reset')
controller = require('../controller')
Space = React.createFactory(require('./space'))
Button = React.createFactory(require('./button'))
Content = React.createFactory(require('./content'))
_React$DOM = React.DOM
div = _React$DOM.div
input = _React$DOM.input
textarea = _React$DOM.textarea
module.exports = React.createClass(
  displayName: 'topic-post'
  propTypes: {}
  getInitialState: ->
    {
      title: ''
      content: ''
      showPreview: false
    }
  onTitleChange: (event) ->
    @setState title: event.target.value
  onContentChange: (event) ->
    @setState content: event.target.value
  onPreview: ->
    @setState showPreview: !@state.showPreview
  onSubmit: ->
    controller.topicCreate
      title: @state.title
      content: @state.content
      tab: 'ask'
  render: ->
    div { style: @styleRoot() },
      input
        value: @state.title
        style: @styleTitle()
        onChange: @onTitleChange
        placeholder: 'title'
      Space(height: 10)
      if @state.showPreview
        div { style: @styleWrapper() },
          Content(text: @state.content)
      else
        textarea
          value: @state.content
          style: @styleContent()
          onChange: @onContentChange
          placeholder: 'content'
        Space(height: 10)
        div { style: @styleToolbar() },
          Button
            text: 'preview'
            onClick: @onPreview
          Space(width: 10)
          Button
            text: 'submit'
            onClick: @onSubmit
  styleRoot: ->
    {
      padding: '20px'
      width: 800
    }
  styleTitle: ->
    {
      border: '1px solid ' + hsl(0, 0, 90)
      outline: 'none'
      width: '100%'
      lineHeight: '30px'
      fontSize: '14px'
      padding: '0 10px'
      fontFamily: reset.contentFonts
    }
  styleContent: ->
    {
      border: '1px solid ' + hsl(0, 0, 90)
      outline: 'none'
      width: '100%'
      fontSize: '14px'
      lineHeight: '1.8em'
      padding: '0 9px'
      fontFamily: reset.codeFonts
      minHeight: '400px'
      paddingTop: 13
    }
  styleToolbar: ->
    {
      display: 'flex'
      justifyContent: 'flex-end'
    }
  styleWrapper: ->
    { padding: '0 10px' }
)
