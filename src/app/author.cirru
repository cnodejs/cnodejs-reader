
var
  hsl $ require :hsl
  React $ require :react
  Immutable $ require :immutable

var
  reset $ require :../util/reset

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

  :render $ \ ()
    div ({} (:style $ @styleRoot))
      Avatar $ {} (:url $ @props.author.get :avatar_url)
      cond @props.showName
        span ({} (:style $ @styleName))
          @props.author.get :loginname

  :styleRoot $ \ ()
    {}
      :display :flex
      :alignItems :center

  :styleName $ \ ()
    {}
      :fontFamily reset.fashionFonts
      :paddingLeft :10px
      :paddingRight :10px
      :backgroundColor $ hsl 150 50 80
      :color $ hsl 0 0 100
      :lineHeight :24px
      :fontSize :13px
