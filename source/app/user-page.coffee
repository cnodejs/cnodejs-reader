
React = require 'react'
superagent = require 'superagent'

$ = React.DOM

Loading = require '../module/loading'
Hint = require '../module/hint'
UserCard = require './user-card'
config = require '../config'
TopicTitle = require './topic-title'

module.exports = React.createFactory React.createClass
  displayName: 'user-page'

  getInitialState: ->
    data: null
    loading: 'ease'

  componentWillReceiveProps: (props, state) ->
    @loadUser props.params.userid

  componentDidMount: ->
    @loadUser @props.params.userid

  loadUser: (user) ->
    @setState loading: 'busy', data: null
    superagent
    .get "#{config.host}/user/#{user}"
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
          $.div className: 'group-profile paragraph',
            UserCard data: @state.data
            if @state.data.githubUsername?
              $.div className: 'github',
                'GitHub: '
                Hint mode: 'info', data: @state.data.githubUsername
            $.div className: 'score',
              'Scores: '
              Hint mode: 'info', data: @state.data.score
          if @state.data.recent_topics.length > 0
            $.div className: 'group-topics divide',
              $.div className: 'section', 'Recent Topics'
              @renderTopics @state.data.recent_topics
          if @state.data.recent_replies.length > 0
            $.div className: 'group-replies divide',
              $.div className: 'section', 'Recent Replies'
              @renderTopics @state.data.recent_replies