
React = require 'react'

$ = React.DOM

module.exports = React.createFactory React.createClass
  displayName: 'module-loading'

  propTypes:
    data: React.PropTypes.string # 'ease', 'busy'

  render: ->
    $.div className: 'module-loading',
      switch @props.data
        when 'ease' then ''
        when 'busy' then 'Loading...'