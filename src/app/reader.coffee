'use strict'
hsl = require('hsl')
React = require('react')
Immutable = require('immutable')
controller = require('../controller')
Space = React.createFactory(require('./space'))
Button = React.createFactory(require('./button'))
TopicList = React.createFactory(require('./topic-list'))
TopicPost = React.createFactory(require('./topic-post'))
UserDetail = React.createFactory(require('./user-detail'))
TopicDetail = React.createFactory(require('./topic-detail'))
AppWireframe = React.createFactory(require('./app-wireframe'))
TopicWireframe = React.createFactory(require('./topic-wireframe'))
_React$DOM = React.DOM
div = _React$DOM.div
input = _React$DOM.input
module.exports = React.createClass(
  displayName: 'app-reader'
  propTypes: store: React.PropTypes.instanceOf(Immutable.Map).isRequired
  getInitialState: ->
    { token: '' }
  onTokenChange: (event) ->
    @setState token: event.target.value
  onLogin: ->
    controller.userAccesstoken @state.token
  onPost: ->
    controller.routerPost()
  onRefresh: ->
    controller.topicRefresh()

  render: ->
    store = @props.store
    isLoading = store.getIn([
      'device'
      'isLoading'
    ])
    loadingKind = store.getIn([
      'device'
      'loadingKind'
    ])
    routerName = store.getIn([
      'router'
      'name'
    ])
    routerId = store.getIn([
      'router'
      'data'
      'id'
    ])
    loginname = store.getIn([
      'router'
      'data'
      'loginname'
    ])
    user = store.getIn([
      'device'
      'loginname'
    ])
    isTopicEnd = store.getIn([
      'device'
      'isTopicEnd'
    ])
    if isLoading and loadingKind == 'start'
      AppWireframe()
    else
      div { style: @styleRoot() },
        div { style: @styleMain() },
          div (style: @styleAroundSpace)
          div { style: @styleList },
            if user != null
              div { style: @styleToolbar() },
                Button(
                  text: 'refresh'
                  onClick: @onRefresh)
                Space(width: 10)
                Button
                  text: 'post'
                  onClick: @onPost
            else
              div { style: @styleToolbar() },
              input(
                style: @styleToken()
                value: @state.token
                onChange: @onTokenChange
                placeholder: 'put token here'),
              Space(width: 10),
              Button
                text: 'login'
                onClick: @onLogin
            TopicList
              topics: @props.store.get('topics')
              messages: @props.store.get('messages')
              isTopicEnd: isTopicEnd
              selectedTopic: routerId
          if isLoading and loadingKind == 'topic'
            TopicWireframe()
          else
            switch routerName
              when 'topic'
                TopicDetail
                  topic: store.getIn([
                    'topicDetails'
                    routerId
                  ])
                  isLogined: user != null
              when 'user'
                UserDetail(user: store.getIn([
                  'users'
                  loginname
                ]))
              when 'post'
                TopicPost()
          div(style: @styleAroundSpace)
  styleRoot: ->
    {
      position: 'absolute'
      width: '100%'
      height: '100%'
      overflowX: 'auto'
      backgroundColor: hsl(180, 26, 28)
    }
  styleMain: ->
    {
      width: '3200px'
      display: 'flex'
      height: '100%'
    }
  styleList:
    height: '100%'
    display: 'flex'
    flexDirection: 'column'
    borderRight: '1px solid ' + hsl(0, 0, 90)
    backgroundColor: 'white'
  styleToolbar: ->
    {
      display: 'flex'
      alignItems: 'center'
      padding: '10px 40px'
      justifyContent: 'flex-end'
    }
  styleToken: ->
    {
      border: 'none'
      outline: 'none'
      borderBottom: '1px solid ' + hsl(240, 80, 90)
      lineHeight: '24px'
      padding: '0 5px'
      width: 200
    }
  styleFooter: ->
    {
      display: 'flex'
      justifyContent: 'flex-end'
    }
  styleAroundSpace:
    width: 400
    flexShrink: 0)
