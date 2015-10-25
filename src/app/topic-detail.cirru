
var
  React $ require :react
  Immutable $ require :immutable

var
  reset $ require :../util/reset

var
  Time $ React.createFactory $ require :./time
  Hint $ React.createFactory $ require :./hint
  Space $ React.createFactory $ require :./space
  Author $ React.createFactory $ require :./author
  Content $ React.createFactory $ require :./content
  ReplyDetail $ React.createFactory $ require :./reply-detail

var
  ({}~ div) React.DOM

= module.exports $ React.createClass $ {}
  :displayName :topic-detail

  :propTypes $ {}
    :topic $ . (React.PropTypes.instanceOf Immutable.Map) :isRequired

  :render $ \ ()
    var
      topic @props.topic

    div ({} (:style $ @styleRoot))
      div ({} (:style $ @styleContent))
        div ({} (:style $ @styleTitle))
          topic.get :title
        div ({} (:style $ @styleInfo))
          Author $ {} (:author $ topic.get :author) (:showName true)
          Space $ {} (:width 10)
          Time $ {} (:time $ topic.get :create_at)
          Space $ {} (:width 10)
          Hint $ {} (:text $ + (topic.get :reply_count) :/ (topic.get :visit_count))
        Space $ {} (:height :20px)
        Content $ {} (:text $ topic.get :content)
      div ({} (:style $ @styleReplies))
        ... topic (get :replies) $ map $ \ (reply)
          ReplyDetail $ {} (:reply reply) (:key $ reply.get :id)

  :styleRoot $ \ ()
    {}
      :display :flex
      :width :1600px
      :overflowY :auto
      :height :100%

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
      :overflowY :auto

  :styleTitle $ \ ()
    {}
      :fontSize :18px
      :fontWeight :bold
      :fontFamily reset.contentFonts
      :lineHeight :2em

  :styleInfo $ \ ()
    {}
      :display :flex
      :alignItems :center
      :justifyContent :flex-start
