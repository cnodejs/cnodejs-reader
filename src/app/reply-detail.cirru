
var
  hsl $ require :hsl
  React $ require :react
  Immutable $ require :immutable

var
  Time $ React.createFactory $ require :./time
  Space $ React.createFactory $ require :./space
  Author $ React.createFactory $ require :./author
  Content $ React.createFactory $ require :./content

var
  ({}~ div) React.DOM

= module.exports $ React.createClass $ {}
  :displayName :reply-detail

  :propTypes $ {}
    :reply $ . (React.PropTypes.instanceOf Immutable.Map) :isRequired

  :render $ \ ()
    var
      reply @props.reply

    div ({} (:style $ @styleRoot))
      div ({} (:style $ @styleInfo))
        Author $ {} (:author $ reply.get :author) (:showName true)
        Space $ {} (:width 10)
        Time $ {} (:time $ reply.get :create_at)
      div ({} (:style $ @styleContent))
        Content $ {} (:text $ reply.get :content)

  :styleRoot $ \ ()
    {}
      :marginTop :10px

  :styleInfo $ \ ()
    {}
      :display :flex
      :alignItems :center

  :styleContent $ \ ()
    {}
      :paddingLeft :24px