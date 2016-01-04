
var
  hsl $ require :hsl
  React $ require :react
  Immutable $ require :immutable

var
  reset $ require :../util/reset
  controller $ require :../controller

var
  Time $ React.createFactory $ require :./time
  Hint $ React.createFactory $ require :./hint
  Space $ React.createFactory $ require :./space
  Author $ React.createFactory $ require :./author

var
  ({}~ div span a) React.DOM

= module.exports $ React.createClass $ {}
  :displayName :topic-entry

  :propTypes $ {}
    :topic $ . (React.PropTypes.instanceOf Immutable.Map) :isRequired
    :showLabel React.PropTypes.bool
    :isSelected React.PropTypes.bool

  :getDefaultProps $ \ ()
    {}
      :showLabel false
      :isSelected false

  :onClick $ \ ()
    controller.routerTopic $ @props.topic.get :id

  :render $ \ ()
    var
      id $ @props.topic.get :id
      replies $ @props.topic.get :reply_count
      visits $ @props.topic.get :visit_count
    div ({} (:style $ @styleRoot) (:onClick @onClick))
      a ({} (:style @styleTitle) (:href $ + :#/topic/ id) (:className :topic-title))
        @props.topic.get :title
      Space $ {} (:width 10)
      cond @props.showLabel
        Hint $ {} (:text $ + replies :/ visits)
      Space $ {} (:width 10)
      cond (@props.topic.get :last_reply_at)
        Time $ {} :time (@props.topic.get :last_reply_at)

  :styleRoot $ \ ()
    {}
      :fontFamily reset.contentFonts
      :lineHeight :36px
      :fontSize :15px
      :display :flex
      :flexDirection :row
      :alignItems :center
      :padding ":8px 10px"
      :cursor :pointer
      :borderBottom $ + ":1px solid " $ hsl 0 0 95
      :backgroundColor $ cond @props.isSelected
        hsl 0 0 95
        hsl 0 0 100

  :styleTitle $ {}
    :textDecoration :none
    :whiteSpace :nowrap
    :overflow :hidden
    :textOverflow :ellipsis
    :padding ":0 0px"
    :lineHeight 1.6
