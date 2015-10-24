
var
  React $ require :react
  ReactDOM $ require :react-dom
  recorder $ require :actions-recorder

require :../style/main.css

var
  schema $ require :./schema
  updater $ require :./updater
  controller $ require :./controller

var
  Page $ React.createFactory $ require :./app/page

recorder.setup $ {}
  :schema schema.store
  :updater updater

var render $ \ (core)
  ReactDOM.render (Page $ {} (:core core)) (document.querySelector :#app)

recorder.request render
recorder.subscribe render

if module.hot
  module.hot.accept ([] :./schema :./updater) $ \ ()
    var
      schema $ require :./schema
      updater $ require :./updater
    recorder.hotSetup $ {}
      :schema schema.store
      :updater updater

controller.start
