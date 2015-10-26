
var
  hsl $ require :hsl
  React $ require :react
  Immutable $ require :immutable

var
  reset $ require :../util/reset

var
  Hint $ React.createFactory $ require :./hint
  Space $ React.createFactory $ require :./space
  Author $ React.createFactory $ require :./author
  TopicEntry $ React.createFactory $ require :./topic-entry

var
  ({}~ div) React.DOM

= module.exports $ React.createClass $ {}
  :displayName :user-detail

  :propTypes $ {}
    :user $ . (React.PropTypes.instanceOf Immutable.Map) :isRequired

  :renderTopics $ \ ()
    var
      topics $ @props.user.get :recent_topics
    topics.map $ \ (topic)
      TopicEntry $ {} (:topic topic) (:key $ topic.get :id)

  :renderReplies $ \ ()
    var
      topics $ @props.user.get :recent_replies
    topics.map $ \ (topic)
      TopicEntry $ {} (:topic topic) (:key $ topic.get :id)

  :render $ \ ()
    div ({} (:style $ @styleRoot))
      Author $ {} (:author @props.user) (:showName true)
      Space $ {} (:height 10)
      div ({} (:style $ @styleLine))
        div ({} (:style $ @styleField)) :GitHub
        Space $ {} (:width 10)
        Hint $ {} (:text $ @props.user.get :githubUsername)
      Space $ {} (:height 10)
      div ({} (:style $ @styleLine))
        div ({} (:style $ @styleField)) :Score
        Space $ {} (:width 10)
        Hint $ {} (:text $ String $ @props.user.get :score)
      Space $ {} (:height 10)
      div ({} (:style $ @styleSection)) ":Recent posted topics:"
      @renderTopics
      div ({} (:style $ @styleSection)) ":Recent replied topics:"
      @renderReplies

  :styleRoot $ \ ()
    {}
      :padding :20px

  :styleLine $ \ ()
    {}
      :display :flex
      :fontSize :13px
      :alignItems :center

  :styleField $ \ ()
    {}
      :width :80px
      :fontFamily reset.contentFonts

  :styleSection $ \ ()
    {}
      :fontFamily reset.fashionFonts
      :fontWeight :bold
      :fontSize :14px
      :marginTop :10px
      :marginBottom :10px
