
React = require 'react'
request = require 'superagent'

$ = React.DOM
Loading = require '../modules/loading'
TopicTitle = require './topic-title'

module.exports = React.createClass
  displayName: 'topic-list'

  getInitialState: ->
    loading: no
    topics: []

  componentDidMount: ->
    @setState loading: yes
    request
    .get('http://localhost:3000/api/v1/topics')
    .end (res) =>
      @setState loading: no
      if res.status is 200
        @setState topics: res.body.data

  renderTitles: ->
    @state.topics.map (topic) ->
      TopicTitle key: topic.id, data: topic

  render: ->
    $.div className: 'topic-list',
      if @state.loading
        Loading()
      @renderTitles()