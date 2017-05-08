'use strict'
hsl = require('hsl')
React = require('react')
reset = require('../util/reset')
div = React.DOM.div
now = new Date
thisYear = now.getFullYear()
thisMonth = now.getMonth()
thisDay = now.getDate()
module.exports = React.createClass(
  displayName: 'app-time'
  propTypes: time: React.PropTypes.string.isRequired
  getTime: ->
    thatTime = new Date(@props.time)
    current = new Date
    thatYear = thatTime.getFullYear()
    thatMonth = thatTime.getMonth()
    thatDay = thatTime.getDate()
    thatHour = thatTime.getHours()
    thatMin = thatTime.getMinutes()
    currentHour = current.getHours()
    currentMin = current.getMinutes()
    if thatYear != thisYear
      return thatYear + '/' + thatMonth + '/' + thatDay
    if thatMonth != thisMonth
      return thisMonth + '/' + thatDay
    if thatDay != thisDay
      return '' + thisDay - thatDay + ' ' + 'days'
    if thatHour != currentHour
      return thatHour + ':' + thatMin
    if thatMin != currentMin
      return thatHour + ':' + thatMin
    'now'
  render: ->
    div { style: @styleRoot() }, @getTime()
  styleRoot: ->
    {
      color: hsl(0, 0, 86)
      fontFamily: reset.fashionFonts
      padding: '0 0px'
      lineHeight: '18px'
      height: '18px'
      fontSize: '12px'
      borderRadius: 2
      whiteSpace: 'nowrap'
    }
)
