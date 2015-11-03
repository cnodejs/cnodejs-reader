
var
  React $ require :react
  keycode $ require :keycode
  Immutable $ require :immutable

var
  routes $ require :../routes
  controller $ require :../controller

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
      :path $ Immutable.List

  :componentDidMount $ \ ()
    window.addEventListener :keydown @onWindowKeydown
    window.addEventListener :resize @onResize

  :componentWillUnmount $ \ ()
    window.removeEventListener :keydown @onWindowKeydown
    window.removeEventListener :resize @onResize

  :isLoading $ \ ()
    var store $ @props.core.get :store
    store.getIn $ [] :device :isLoading

  :onResize $ \ ()
    @forceUpdate

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
    if (not $ @isLoading) $ do
      controller.routerGo info
    , undefined

  :onPathChange $ \ (path)
    @setState $ {} (:path path)

  :renderDevtools $ \ ()
    div ({} (:style $ @styleDevtools))
      Devtools $ {}
        :core @props.core
        :width 400
        :height window.innerHeight
        :path @state.path
        :onPathChange @onPathChange

  :render $ \ ()
    var
      store $ @props.core.get :store
      loginname $ store.getIn $ [] :device :loginname
    div ({} (:style $ @styleRoot))
      Reader $ {} (:store store) (:isLogined loginname)
      cond @state.showDevtools
        @renderDevtools
      Addressbar $ {}
        :route $ store.get :router
        :rules routes
        :onPopstate @onPopstate
        :skipRendering $ @isLoading
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
      :width window.innerWidth
      :height window.innerHeight
