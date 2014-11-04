
React = require 'react'
Router = require 'react-router'

{Routes, Route, DefaultRoute} = Router

$ = React.DOM

Layout = require './app/page'
TopicList = require './app/topic-list'
MessagesPage = require './app/message-page'
TopicPage = require './app/topic-page'
UserPage = require './app/user-page'
PostPage = require './app/post-page'

component = Routes location: 'history',
  Route page: '/', handler: Page,
    DefaultRoute handler: TopicList
    Route name: 'messages', page: '/messages', handler: MessagesPage
    Route name: 'topic', path: '/topic/:topicid', handler: TopicPage
    Route name: 'user', path: '/user/:userid', handler: UserPage
    Route name: 'post', path: '/post', handler: PostPage

React.render component, document.body