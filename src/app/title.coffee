
React = require('react')
div = React.DOM.div

module.exports = React.createClass
  displayName: 'app-avatar'
  propTypes:
    title: React.PropTypes.string.isRequired

  renderTitle: ->
    if document.title != @props.title
      document.title = @props.title

  render: ->
    @renderTitle()
    div {}
