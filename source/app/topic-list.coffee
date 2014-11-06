
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
    tab: @props.query.tab or 'all'

  componentWillReceiveProps: (props, state) ->
    tab = props.query.tab or 'all'
    page = (Number props.query.page) or 1
    @loadTopics {tab, page}

  componentDidMount: ->
    @loadTopics tab: @state.tab, page: @state.page

  loadTopics: (options) ->
    @setState
      loading: 'busy'
      topics: []
      tab: options.tab
      page: options.page
    request
    .get "#{config.host}/topics"
    .query page: options.page
    .query limit: 40
    .query tab: options.tab
    .end (res) =>
      if res.ok
        @setState loading: 'ease', topics: res.body.data
      else
        @setState loading: 'ease'

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
    $.div className: 'topic-list divide',
      $.div className: 'action',
        Select
          data: ['all'].concat tabs
          chosen: @state.tab
          onItemClick: @onTabClick
        $.div className: 'line',
          if @state.page > 1
            $.span className: 'button prev-page', onClick: @prevPage, '<'
          $.span className: 'mark page', @state.page
          $.span className: 'button next-page', onClick: @nextPage, '>'
      @renderTitles()
      Loading data: @state.loading