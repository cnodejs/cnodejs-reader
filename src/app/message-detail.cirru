
var
  hsl $ require :hsl
  React $ require :react
  Immutable $ require :immutable

var
  Hint $ React.createFactory $ require :./hint
  Space $ React.createFactory $ require :./space
  Author $ React.createFactory $ require :./author
  TopicEntry $ React.createFactory $ require :./topic-entry
  ReplyDetail $ React.createFactory $ require :./reply-detail

var
  ({}~ div) React.DOM

= module.exports $ React.createClass $ {}
  :displayName :message-detail

  :propTypes $ {}
    :message $ . (React.PropTypes.instanceOf Immutable.Map) :isRequired

  :render $ \ ()
    var
      author $ @props.message.get :author
      topic $ ... @props.message (get :topic) (set :author author)
      reply $ ... @props.message (get :reply) (set :author author)

    div ({} (:style $ @styleRoot))
      div ({} (:style $ @styleInfo))
        Author $ {} (:author $ @props.message.get :author) (:showName true)
        Space $ {} (:width 10)
        Hint $ {} (:text $ @props.message.get :type)
      TopicEntry $ {} (:topic topic)
      ReplyDetail $ {} (:reply reply)

  :styleRoot $ \ ()
    {}
      :padding ":0 10px"

  :styleInfo $ \ ()
    {}
      :display :flex
      :alignItems :center

