
var
  hsl $ require :hsl
  React $ require :react
  keycode $ require :keycode
  Immutable $ require :immutable

var
  reset $ require :../util/reset
  configs $ require :../configs
  controller $ require :../controller

var
  Time $ React.createFactory $ require :./time
  Hint $ React.createFactory $ require :./hint
  Space $ React.createFactory $ require :./space
  Button $ React.createFactory $ require :./button
  Author $ React.createFactory $ require :./author
  Content $ React.createFactory $ require :./content
  ReplyDetail $ React.createFactory $ require :./reply-detail

var
  ({}~ div textarea a) React.DOM

= module.exports $ React.createClass $ {}
  :displayName :topic-detail

  :propTypes $ {}
    :topic $ . (React.PropTypes.instanceOf Immutable.Map) :isRequired
    :isLogined React.PropTypes.bool.isRequired

  :getInitialState $ \ ()
    {}
      :text :

  :onTextChange $ \ (event)
    @setState $ {}
      :text event.target.value

  :onSubmit $ \ ()
    controller.replyCreate $ {}
      :topic_id $ @props.topic.get :id
      :content @state.text
    @setState $ {} (:text :)

  :onTextKeyDown $ \ (event)
    if
      and (is (keycode event.keyCode) :enter)
        or event.ctrlKey event.metaKey
      do $ @onSubmit
    , undefined

  :renderEditor $ \ ()
    div ({} (:style $ @styleEditor))
      Space $ {} (:height 20)
      textarea $ {} (:style $ @styleText)
        :value @state.text
        :onChange @onTextChange
        :onKeyDown @onTextKeyDown
        :placeholder :reply...
      Space $ {} (:height 10)
      div ({} (:style $ @styleWrapper))
        Content $ {} (:text @state.text)
      Space $ {} (:height 10)
      div ({} (:style $ @styleToolbar))
        Button $ {} (:text :submit) (:onClick @onSubmit)
      Space $ {} (:height 400)

  :render $ \ ()
    var
      topic @props.topic
      replies $ topic.get :replies

    div ({} (:style $ @styleRoot))
      div ({} :style @styleContent)
        div ({} (:style $ @styleTitle))
          topic.get :title
        Space $ {} :height 20
        div ({} (:style $ @styleInfo))
          Author $ {} (:author $ topic.get :author) (:showName true)
          Space $ {} (:width 10)
          Time $ {} (:time $ topic.get :create_at)
          Space $ {} (:width 10)
          Hint $ {} (:text $ + (topic.get :reply_count) :/ (topic.get :visit_count))
          Space $ {} (:width 10)
          a
            {} (:target :_blank) (:style $ @styleLink)
              :href $ + configs.domain :/topic/ $ topic.get :id
            , ":🔗"
        Space $ {} (:height 20)
        Content $ {} (:text $ topic.get :content)
      div ({} (:style $ @styleReplies))
        div ({} (:style $ @styleSection))
          + replies.size ": reples"
        replies.map $ \ (reply)
          ReplyDetail $ {} (:reply reply) (:key $ reply.get :id)
        cond @props.isLogined
          @renderEditor

  :styleRoot $ \ ()
    {}
      :display :flex
      :width :1600px
      :overflowY :auto
      :height :100%
      :backgroundColor :white

  :styleContent $ {}
    :width :800px
    :paddingBottom :300px
    :paddingLeft :40px
    :paddingRight :40px
    :height :100%
    :overflowY :auto
    :borderRight $ + ":1px solid " (hsl 0 0 90)

  :styleReplies $ \ ()
    {}
      :width :800px
      :height :100%
      :display :inline-block
      :overflowY :auto
      :padding ":20px 40px"

  :styleTitle $ \ ()
    {}
      :fontSize :18px
      :fontWeight :bold
      :fontFamily reset.contentFonts
      :lineHeight :2.8em

  :styleInfo $ \ ()
    {}
      :display :flex
      :alignItems :center
      :justifyContent :flex-start

  :styleSection $ \ ()
    {}
      :fontFamily reset.fashionFonts
      :fontWeight :bold
      :marginBottom :20px

  :styleEditor $ \ ()
    {}

  :styleToolbar $ \ ()
    {}
      :display :flex
      :flexDirection :row
      :justifyContent :flex-end

  :styleText $ \ ()
    {}
      :width :100%
      :border $ + ":1px solid " $ hsl 0 0 90
      :outline :none
      :minHeight 100
      :fontSize :14px
      :lineHeight :1.8em
      :fontFamily reset.codeFonts
      :padding 10
      :resize :resize-y

  :styleWrapper $ \ ()
    {}
      :padding 10
      :border $ + ":1px solid " $ hsl 0 0 90

  :styleLink $ \ ()
    {}
      :textDecoration :none
      :fontFamily reset.contentFonts
      :fontSize :12px
