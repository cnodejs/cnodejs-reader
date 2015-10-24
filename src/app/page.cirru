
var
  React $ require :react
  keycode $ require :keycode
  Immutable $ require :immutable

var
  Devtools $ React.createFactory $ require :actions-recorder/lib/devtools
  Reader $ React.createFactory $ require :./reader

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
        or event.metaKey event.CtrlKey
      do
        @setState $ {}
          :showDevtools $ not @state.showDevtools
    , undefined

  :renderDevtools $ \ ()
    div ({} (:style $ @styleDevtools))
      Devtools $ {}
        :core @props.core
        :width 400
        :height window.innerHeight

  :render $ \ ()
    div ({} (:style $ @styleRoot))
      Reader $ {} (:store $ @props.core.get :store)
      cond @state.showDevtools
        @renderDevtools

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
