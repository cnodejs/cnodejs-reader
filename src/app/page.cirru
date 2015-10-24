
var
  React $ require :react
  keycode $ require :keycode
  Immutable $ require :immutable

var
  routes $ require :../routes

var
  Reader $ React.createFactory $ require :./reader
  Devtools $ React.createFactory $ require :actions-recorder/lib/devtools
  Addressbar $ React.createFactory $ require :router-view

var
  ({}~ div) React.DOM

= module.exports $ React.createClass $ {}
  :displayName :app-page

  :propTypes $ {}
    :core $ . (React.PropTypes.instanceOf Immutable.Map) :isRequired

  :getInitialState $ \ ()
    {}
      :showDevtools false

  :componentDidMount $ \ ()
    window.addEventListener :keydown @onWindowKeydown

  :componentWillUnmount $ \ ()
    window.removeEventListener :keydown @onWindowKeydown

  :onWindowKeydown $ \ (event)
    if
      and
        is (keycode event.keyCode) :a
        , event.shiftKey
        or event.metaKey event.ctrlKey
      do
        @setState $ {}
          :showDevtools $ not @state.showDevtools
    , undefined

  :onPopstate $ \ (info)
    console.log :onPopstate info

  :renderDevtools $ \ ()
    div ({} (:style $ @styleDevtools))
      Devtools $ {}
        :core @props.core
        :width 400
        :height window.innerHeight

  :render $ \ ()
    var
      store $ @props.core.get :store
    div ({} (:style $ @styleRoot))
      Reader $ {} (:store store)
      cond @state.showDevtools
        @renderDevtools
      Addressbar $ {}
        :route $ store.get :router
        :rules routes
        :onPopstate @onPopstate
        :duringLoading $ store.getIn $ [] :device :isLoading
        :inHash true

  :styleRoot $ \ ()
    {}
      :position :absolute
      :width :100%
      :height :100%

  :styleDevtools $ \ ()
    {}
      :position :fixed
      :right 0
      :top 0
      :width :800px
      :height window.innerHeight
