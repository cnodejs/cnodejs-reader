
var
  React $ require :react
  Immutable $ require :immutable

var
  reset $ require :../util/reset

var
  Content $ React.createFactory $ require :./content

var
  ({}~ div) React.DOM

= module.exports $ React.createClass $ {}
  :displayName :topic-detail

  :propTypes $ {}
    :topic $ . (React.PropTypes.instanceOf Immutable.Map) :isRequired

  :render $ \ ()
    div ({} (:style $ @styleRoot))
      div ({} (:style $ @styleContent))
        div ({} (:style $ @styleTitle))
          @props.topic.get :title
        Content $ {} (:text $ @props.topic.get :content)
      div ({} (:style $ @styleReplies))

  :styleRoot $ \ ()
    {}
      :display :flex
      :width :1600px
      :overflowY :auto

  :styleContent $ \ ()
    {}
      :width :800px
      :paddingBottom :300px
      :paddingLeft :20px
      :paddingRight :20px

  :styleReplies $ \ ()
    {}
      :width :800px
      :height :100%
      :display :inline-block

  :styleTitle $ \ ()
    {}
      :fontSize :18px
      :fontWeight :bold
      :fontFamily reset.contentFonts
      :marginBottom :40px
