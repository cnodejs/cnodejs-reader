'use strict'
hsl = require('hsl')
React = require('react')
Immutable = require('immutable')
controller = require('../controller')
Title = React.createFactory(require('./title'))
Button = React.createFactory(require('./button'))
MessageDetail = React.createFactory(require('./message-detail'))
div = React.DOM.div
module.exports = React.createClass(
  displayName: 'message-list'
  propTypes: messages: React.PropTypes.instanceOf(Immutable.List).isRequired
  onClear: ->
    controller.messageMarkAll()
  render: ->
    count = @props.messages.size
    if count > 0 then div({ style: @styleRoot() }, Title(title: '(' + count + ') ' + 'CNode.js'), @props.messages.map(((message) ->
      MessageDetail
        message: message
        key: message.get('id')
    )), div({ style: @styleToolbar() }, Button(
      text: 'clear'
      onClick: @onClear))) else div(null, Title(title: 'CNode.js'))
  styleRoot: ->
    {
      backgroundColor: hsl(0, 30, 96)
      padding: '10px 0'
    }
  styleToolbar: ->
    {
      display: 'flex'
      justifyContent: 'flex-end'
      padding: '0 10px'
    }
)
