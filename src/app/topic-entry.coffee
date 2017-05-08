
hsl = require('hsl')
React = require('react')
Immutable = require('immutable')
reset = require('../util/reset')
controller = require('../controller')
Time = React.createFactory(require('./time'))
Hint = React.createFactory(require('./hint'))
Space = React.createFactory(require('./space'))
Author = React.createFactory(require('./author'))
_React$DOM = React.DOM
div = _React$DOM.div
span = _React$DOM.span
a = _React$DOM.a
module.exports = React.createClass(
  displayName: 'topic-entry'
  propTypes:
    topic: React.PropTypes.instanceOf(Immutable.Map).isRequired
    showLabel: React.PropTypes.bool
    isSelected: React.PropTypes.bool
  getDefaultProps: ->
    {
      showLabel: false
      isSelected: false
    }
  onClick: ->
    controller.routerTopic @props.topic.get('id')
  render: ->
    id = @props.topic.get('id')
    replies = @props.topic.get('reply_count')
    visits = @props.topic.get('visit_count')
    div
      style: @styleRoot()
      onClick: @onClick
      a
        style: @styleTitle
        href: '#/topic/' + id
        className: 'topic-title'
      @props.topic.get('title')
      Space(width: 10)
      if @props.showLabel
        Hint(text: replies + '/' + visits)
      Space(width: 10)
      if @props.topic.get('last_reply_at')
        Time(time: @props.topic.get('last_reply_at'))
  styleRoot: ->
    {
      fontFamily: reset.contentFonts
      lineHeight: '36px'
      fontSize: '15px'
      display: 'flex'
      flexDirection: 'row'
      alignItems: 'center'
      padding: '10px 40px'
      cursor: 'pointer'
      backgroundColor: if @props.isSelected then hsl(0, 0, 95) else hsl(0, 0, 100, 0)
    }
  styleTitle:
    textDecoration: 'none'
    whiteSpace: 'nowrap'
    overflow: 'hidden'
    textOverflow: 'ellipsis'
    padding: '0 0px'
    lineHeight: 1.6)
