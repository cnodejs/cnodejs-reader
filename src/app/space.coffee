
React = require('react')
div = React.DOM.div
module.exports = React.createClass
  displayName: 'app-space'
  propTypes:
    width: React.PropTypes.number
    height: React.PropTypes.number

  render: ->
    div style: @styleRoot()

  styleRoot: ->
    width: @props.width or '100%'
    height: @props.height or '1em'
