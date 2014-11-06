
React = require 'react'

$ = React.DOM

module.exports = React.createFactory React.createClass
  displayName: 'module-loading'

  propTypes:
    data: React.PropTypes.string # 'ease', 'busy'

  renderLetters: (text) ->
    text.split('').map (letter, index) =>
      $.span
        style:
          animationDelay: "#{index * 140}ms"
        letter

  render: ->
    switch @props.data
      when 'ease'
        $.div className: 'module-loading', ''
      when 'busy'
        $.div className: 'module-loading',
          @renderLetters 'Loading data...'