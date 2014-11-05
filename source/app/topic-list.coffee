
React = require 'react'
request = require 'superagent'

config = require '../config'

$ = React.DOM
Loading = require '../module/loading'
TopicTitle = require './topic-title'

module.exports = React.createFactory React.createClass
  displayName: 'topic-list'

  getInitialState: ->
    loading: 'ease'
    topics: []

  componentDidMount: ->
    @setState loading: 'busy'
    request
    .get("#{config.host}/topics")
    .end (res) =>
      @setState loading: 'easy'
      if res.status is 200
        @setState topics: res.body.data

  renderTitles: ->
    @state.topics.map (topic) ->
      TopicTitle key: topic.id, data: topic

  render: ->
    $.div className: 'topic-list',
      Loading data: @state.loading
      @renderTitles()