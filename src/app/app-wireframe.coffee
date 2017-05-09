
hsl = require('hsl')
React = require('react')
reset = require('../util/reset')
Spinner = React.createFactory(require('./spinner'))
_React$DOM = React.DOM
div = _React$DOM.div
span = _React$DOM.span

module.exports = React.createClass
  displayName: 'app-wireframe'

  render: ->
    div style: @styleRoot(),
      div style: @styleBox(),
        Spinner()
        span style: @styleText(), 'Loading app...'

  styleRoot: ->
    position: 'absolute'
    width: '100%'
    height: '100%'
    display: 'flex'
    justifyContent: 'center'
    alignItems: 'center'

  styleBox: ->

  styleText: ->
    fontFamily: reset.fashionFonts
    marginTop: '20px'
    display: 'inline-block'
    color: hsl(0, 10, 70)
    fontSize: '13px'
