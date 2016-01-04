
var
  hsl $ require :hsl
  React $ require :react
  Immutable $ require :immutable

var
  reset $ require :../util/reset
  controller $ require :../controller

var
  Avatar $ React.createFactory $ require :./avatar

var
  ({}~ div span) React.DOM

= module.exports $ React.createClass $ {}
  :displayName :app-author

  :propTypes $ {}
    :author $ . (React.PropTypes.instanceOf Immutable.Map) :isRequired
    :showName React.PropTypes.bool

  :getDefaultProps $ \ ()
    {}
      :showName false

  :onClick $ \ (event)
    event.stopPropagation
    controller.routerUser $ @props.author.get :loginname

  :render $ \ ()
    div ({} (:style $ @styleRoot) (:onClick @onClick))
      Avatar $ {} (:url $ @props.author.get :avatar_url)
      cond @props.showName
        span ({} (:style $ @styleName))
          @props.author.get :loginname

  :styleRoot $ \ ()
    {}
      :display :flex
      :alignItems :center
      :cursor :pointer

  :styleName $ \ ()
    {}
      :fontFamily reset.fashionFonts
      :paddingLeft :8px
      :color $ hsl 0 0 70
      :lineHeight :24px
      :fontSize :13px
