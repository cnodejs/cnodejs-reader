
var
  hsl $ require :hsl
  React $ require :react
  Immutable $ require :immutable

var
  reset $ require :../util/reset
  controller $ require :../controller

var
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

  :getDefaultProps $ \ ()
    {}
      :showLabel false

  :onClick $ \ ()
    controller.routerTopic $ @props.topic.get :id

  :render $ \ ()
    var
      id $ @props.topic.get :id
      replies $ @props.topic.get :reply_count
      visits $ @props.topic.get :visit_count
    div ({} (:style $ @styleRoot) (:onClick @onClick))
      Author $ {} (:author $ @props.topic.get :author)
      Space $ {} (:width 5)
      a ({} (:style $ @styleTitle) (:href $ + :#/topic id) (:className :topic-title))
        @props.topic.get :title
      Space $ {} (:width 5)
      cond @props.showLabel
        Hint $ {} (:text $ + replies :/ visits)

  :styleRoot $ \ ()
    {}
      :fontFamily reset.contentFonts
      :lineHeight :30px
      :fontSize :14px
      :display :flex
      :flexDirection :row
      :alignItems :center
      :padding :5px
      :cursor :pointer

  :styleTitle $ \ ()
    {}
      :textDecoration :none
      :whiteSpace :nowrap
      :overflow :hidden
      :textOverflow :ellipsis
