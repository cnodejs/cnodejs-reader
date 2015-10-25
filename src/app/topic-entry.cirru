
var
  hsl $ require :hsl
  React $ require :react
  Immutable $ require :immutable

var
  reset $ require :../util/reset
  controller $ require :../controller

var
  Author $ React.createFactory $ require :./author

var
  ({}~ div span a) React.DOM

= module.exports $ React.createClass $ {}
  :displayName :topic-entry

  :propTypes $ {}
    :topic $ . (React.PropTypes.instanceOf Immutable.Map) :isRequired

  :onClick $ \ ()
    controller.routerTopic $ @props.topic.get :id

  :render $ \ ()
    var
      id $ @props.topic.get :id
    div ({} (:style $ @styleRoot) (:onClick @onClick))
      Author $ {} (:author $ @props.topic.get :author)
      a ({} (:style $ @styleTitle) (:href $ + :#/topic id) (:className :topic-title))
        @props.topic.get :title

  :styleRoot $ \ ()
    {}
      :fontFamily reset.contentFonts
      :lineHeight :30px
      :fontSize :14px
      :display :flex
      :flexDirection :row
      :padding :5px
      :cursor :pointer

  :styleTitle $ \ ()
    {}
      :marginLeft :5px
      :textDecoration :none
