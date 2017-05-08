'use strict'
hsl = require('hsl')
React = require('react')
Immutable = require('immutable')
Time = React.createFactory(require('./time'))
Space = React.createFactory(require('./space'))
Author = React.createFactory(require('./author'))
Content = React.createFactory(require('./content'))
div = React.DOM.div
module.exports = React.createClass(
  displayName: 'reply-detail'
  propTypes: reply: React.PropTypes.instanceOf(Immutable.Map).isRequired
  render: ->
    reply = @props.reply
    div { style: @styleRoot() }, div({ style: @styleInfo() }, Author(
      author: reply.get('author')
      showName: true), Space(width: 10), Time(time: reply.get('create_at'))), div({ style: @styleContent() }, Content(text: reply.get('content')))
  styleRoot: ->
    {
      marginTop: '10px'
      padding: '0 0px'
      margin: '40px 0'
    }
  styleInfo: ->
    {
      display: 'flex'
      alignItems: 'center'
    }
  styleContent: ->
    { paddingLeft: '0px' }
)
