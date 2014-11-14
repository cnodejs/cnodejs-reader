
React = require 'react'

$ = React.DOM
$$ = require '../util/helper'

module.exports = React.createFactory React.createClass
  displayName: 'module-select'

  propTypes:
    data: React.PropTypes.string

  formatTime: ->
    now = new Date
    ny = now.getFullYear()
    nM = now.getMonth() + 1
    nd = now.getDate()
    date = new Date @props.data
    y = date.getFullYear()
    M = date.getMonth() + 1
    d = date.getDate()
    h = date.getHours()
    m = date.getMinutes()
    res = []
    if y isnt ny then res.push y
    unless (M is nM) and (d is nd) then res.push "#{M}-#{d}"
    res.push "#{h}:#{m}"
    res.join(' ')

  render: ->
    $.span className: 'module-time',
      @formatTime()