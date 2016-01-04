
var
  React $ require :react
  ReactDOM $ require :react-dom
  recorder $ require :actions-recorder
  pathUtil $ require :router-view/lib/path

require :../style/main.css

var
  routes $ require :./routes
  schema $ require :./schema
  updater $ require :./updater
  controller $ require :./controller

var
  Page $ React.createFactory $ require :./app/page

var
  oldAddress $ location.hash.substr 1
  router $ pathUtil.getCurrentInfo routes oldAddress

recorder.setup $ {}
  :initial schema.store
  :updater updater

var render $ \ (core)
  ReactDOM.render (Page $ {} (:core core)) (document.querySelector :#app)

recorder.request render
recorder.subscribe render

if module.hot $ do
  module.hot.accept ([] :./schema :./updater) $ \ ()
    var
      schema $ require :./schema
      updater $ require :./updater
    recorder.hotSetup $ {}
      :initial schema.store
      :updater updater
  module.hot.accept :./controller $ \ ()
  module.hot.accept :./app/page $ \ ()
    = Page $ React.createFactory $ require :./app/page
    recorder.request render

controller.start

if (is (router.get :name) :topic) $ do
  controller.routerTopic (router.getIn $ [] :data :id)
