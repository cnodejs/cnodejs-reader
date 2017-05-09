
hsl = require('hsl')
React = require('react')
reset = require('../util/reset')
div = React.DOM.div
now = new Date
thisYear = now.getFullYear()
thisMonth = now.getMonth()
thisDay = now.getDate()

module.exports = React.createClass
  displayName: 'app-time'
  propTypes:
    time: React.PropTypes.string.isRequired

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

    switch
      when thatYear isnt thisYear
        "#{thatYear}/#{thatMonth}/#{thatDay}"
      when thatMonth isnt thisMonth
        "#{thisMonth}/#{thatDay}"
      when thatDay isnt thisDay
        "#{thisDay - thatDay}days"
      when thatHour isnt currentHour
        "#{thatHour}:#{thatMin}"
      when thatMin isnt currentMin
        "#{thatHour}:#{thatMin}"
      else 'now'

  render: ->
    div style: @styleRoot(), @getTime()

  styleRoot: ->
    color: hsl(0, 0, 86)
    fontFamily: reset.fashionFonts
    padding: '0 0px'
    lineHeight: '18px'
    height: '18px'
    fontSize: '12px'
    borderRadius: 2
    whiteSpace: 'nowrap'
