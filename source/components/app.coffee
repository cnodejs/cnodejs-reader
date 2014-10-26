
React = require 'react'
$ = React.DOM

module.exports = React.createClass
  displayName: 'app'

  getInitialState: ->
    topics: null
    topicId: null
    userId: null

  render: ->
    topics = []

    $.div {},
      'topics'