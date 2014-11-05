
React = require 'react'
superagent = require 'superagent'

$ = React.DOM

Loading = require '../module/loading'
UserCard = require './user-card'
config = require '../config'
TopicTitle = require './topic-title'

module.exports = React.createFactory React.createClass
  displayName: 'user-page'

  getInitialState: ->
    data: null
    loading: 'ease'

  componentDidMount: ->
    @setState loading: 'busy'
    superagent
    .get "#{config.host}/user/#{@props.params.userid}"
    .end (res) =>
      if res.ok
        data = res.body.data
        @setState {data, loading: 'ease'}
      else
        @setState loading: 'ease'

  renderTopics: (topics) ->
    topics.map (topic, index) =>
      TopicTitle key: index, data: topic

  render: ->
    $.div className: 'user-page',
      Loading data: @state.loading
      if @state.data?
        $.div className: 'wrap',
          $.div className: 'group-profile',
            UserCard data: @state.data
            if @state.data.githubUsername?
              $.div className: 'github', 'GitHub:', @state.data.githubUsername
            $.div className: 'score', 'Scores:', @state.data.score
          if @state.data.recent_topics.length > 0
            $.div className: 'group-topics',
              $.div className: 'section', 'Recent Topics'
              @renderTopics @state.data.recent_topics
          if @state.data.recent_replies.length > 0
            $.div className: 'group-replies',
              $.div className: 'section', 'Recent Replies'
              @renderTopics @state.data.recent_replies