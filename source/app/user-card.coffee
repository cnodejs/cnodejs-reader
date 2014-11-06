
React = require 'react'
Router = require 'react-router'

$ = React.DOM
Navigation = Router.Navigation

module.exports = React.createFactory React.createClass
  displayName: 'user-card'
  mixins: [Navigation]

  onClick: ->
    @transitionTo 'user', userid: @props.data.loginname

  render: ->
    $.span className: 'user-card line', onClick: @onClick,
      $.span
        className: 'avatar'
        style:
          backgroundImage: "url('#{@props.data.avatar_url}')"
      $.span className: 'name', @props.data.loginname