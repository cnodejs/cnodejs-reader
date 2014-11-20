
React = require 'react'
superagent = require 'superagent'

$ = React.DOM

Loading = require '../module/loading'
Hint = require '../module/hint'
Time = require '../module/time'
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
              '积分: '
              Hint mode: 'info', data: @state.data.score
            $.div className: 'join',
              '加入时间: '
              Time data: @state.data.create_at
          if @state.data.recent_topics.length > 0
            $.div className: 'group-topics',
              $.div className: 'section', '最近话题'
              @renderTopics @state.data.recent_topics
          if @state.data.recent_replies.length > 0
            $.div className: 'group-replies',
              $.div className: 'section', '最近回复'
              @renderTopics @state.data.recent_replies