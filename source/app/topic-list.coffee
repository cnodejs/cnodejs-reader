
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
    page: 1

  componentDidMount: ->
    @loadTopics tab: 'all', page: 1
    window.addEventListener 'keydown', @onWindowKeydown

  componentWillUnmount: ->
    window.removeEventListener 'keydown', @onWindowKeydown

  loadTopics: (options) ->
    @setState
      loading: 'busy'
      topics: []
      tab: options.tab
      page: options.page
    request
    .get "#{config.host}/topics"
    .query page: options.page
    .query limit: 200
    .query tab: options.tab
    .end (res) =>
      if res.ok
        @setState loading: 'ease', topics: res.body.data
      else
        @setState loading: 'ease'

  delayAndLoadTopic: ->
    setTimeout =>
      @loadTopics tab: @state.tab, page: @state.page
    , 100

  onTabClick: (tab) ->
    @setState tab: tab, page: @state.page
    @transitionTo '/'
    @delayAndLoadTopic()

  nextPage: ->
    @setState page: (@state.page + 1)
    @delayAndLoadTopic()
    @transitionTo '/'

  prevPage: ->
    if @state.page > 1
      @setState page: (@state.page - 1)
      @delayAndLoadTopic()
      @transitionTo '/'

  onWindowKeydown: (event) ->
    if event.keyCode is 27 # esc
      @transitionTo '/'

  renderTitles: ->
    @state.topics.map (topic) ->
      TopicTitle key: topic.id, data: topic

  render: ->
    $.div className: 'topic-list',
      $.div className: 'action',
        Select
          data: ['all'].concat tabs
          chosen: @state.tab
          onItemClick: @onTabClick
          locale: config.tabLocale
      if @state.loading is 'ease'
        @renderTitles()
      else
        Loading data: @state.loading
      $.div className: 'line pager',
        if @state.page > 1
          $.span className: 'button prev-page', onClick: @prevPage, '◀'
        $.span className: 'mark page', @state.page
        $.span className: 'button next-page', onClick: @nextPage, '▶'