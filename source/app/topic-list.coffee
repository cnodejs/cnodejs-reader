
React = require 'react'
request = require 'superagent'
Router = require 'react-router'

config = require '../config'

$ = React.DOM
Loading = require '../module/loading'
TopicTitle = require './topic-title'
Select = require '../module/select'
Navigation = Router.Navigation

tabs = ['share', 'ask', 'job']

module.exports = React.createFactory React.createClass
  displayName: 'topic-list'
  mixins: [Navigation]

  getInitialState: ->
    loading: 'ease'
    topics: []
    page: (Number @props.query.page) or 1
    tab: if @props.query.tab in tabs then @props.query.tab

  componentWillReceiveProps: (props, state) ->
    tab = props.query.tab
    page = Number props.query.page
    @setState {tab, page}
    @loadTopics {tab, page}

  componentDidMount: ->
    @loadTopics tab: @state.tab, page: @state.page

  loadTopics: (options) ->
    @setState loading: 'busy'
    request
    .get "#{config.host}/topics"
    .query page: options.page
    .query limit: 40
    .query tab: options.tab
    .end (res) =>
      @setState loading: 'easy'
      if res.status is 200
        @setState topics: res.body.data

  onTabClick: (tab) ->
    @transitionTo '/', {}, tab: tab, page: @state.page

  nextPage: ->
    @transitionTo '/', {}, tab: @state.tab, page: (@state.page + 1)

  prevPage: ->
    if @state.page > 1
      @transitionTo '/', {}, tab: @state.tab, page: (@state.page - 1)

  renderTitles: ->
    @state.topics.map (topic) ->
      TopicTitle key: topic.id, data: topic

  render: ->
    $.div className: 'topic-list',
      $.div className: 'action',
        Select
          data: ['all'].concat tabs
          item: 'all'
          onItemClick: @onTabClick
        $.div className: 'line',
          if @state.page > 1
            $.span className: 'button prev-page', onClick: @prevPage, '<'
          $.span className: 'mark page', @state.page
          $.span className: 'button next-page', onClick: @nextPage, '>'
      @renderTitles()
      Loading data: @state.loading