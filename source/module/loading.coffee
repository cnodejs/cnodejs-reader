
React = require 'react'

$ = React.DOM

module.exports = React.createFactory React.createClass
  displayName: 'module-loading'

  propTypes:
    mode: React.PropTypes.string # 'normal', 'loading'

  getDefaultProps: ->
    mode: 'normal'

  render: ->
    $.div className: 'module-loading',
      'loading'