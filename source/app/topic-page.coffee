
React = require 'react'
Router = require 'react-router'
superagent = require 'superagent'

$ = React.DOM
Navigation = Router.Navigation
config = require '../config'
Loading = require '../module/loading'
TopicCard = require './topic-card'
Editor = require '../module/editor'

module.exports = React.createFactory React.createClass
  displayName: 'topic-page'
  mixins: [Navigation]

  getInitialState: ->
    data: undefined
    loading: 'ease'

  componentDidMount: ->
    @setState loading: 'busy'
    superagent
    .get "#{config.host}/topic/#{@props.params.topicid}"
    .end (res) =>
      if res.ok
        data = res.body.data
        @setState {data, loading: 'ease'}
      else
        @setState loading: 'ease'

  onReplySubmit: (text, cb) ->
    cb()

  render: ->
    $.div className: 'topic-page',
      Loading data: @state.loading
      if @state.data?
        TopicCard data: @state.data
      if @props.user?
        Editor onSubmit: @onReplySubmit