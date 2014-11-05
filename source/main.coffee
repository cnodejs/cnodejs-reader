
React = require 'react'
Router = require 'react-router'

Route = Router.Route
Routes = Router.Routes
DefaultRoute = Router.DefaultRoute
NotFoundRoute = Router.NotFoundRoute

$ = React.DOM

Page = require './app/page'
TopicList = require './app/topic-list'
MessagesPage = require './app/message-page'
TopicPage = require './app/topic-page'
UserPage = require './app/user-page'
PostPage = require './app/post-page'

routes = Routes location: 'history',
  Route page: '/', handler: Page,
    DefaultRoute handler: TopicList
    NotFoundRoute handler: TopicList
    Route name: 'messages', page: '/messages', handler: MessagesPage
    Route name: 'topic', path: '/topic/:topicid', handler: TopicPage
    Route name: 'user', path: '/user/:userid', handler: UserPage
    Route name: 'post', path: '/post', handler: PostPage

React.render routes, document.body