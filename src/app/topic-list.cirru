
var
  React $ require :react
  Immutable $ require :immutable

var controller $ require :../controller

var
  Button $ React.createFactory $ require :./button
  TopicEntry $ React.createFactory $ require :./topic-entry

var
  ({}~ div) React.DOM

= module.exports $ React.createClass $ {}
  :displayName :topic-list

  :propTypes $ {}
    :topics $ . (React.PropTypes.instanceOf Immutable.List) :isRequired
    :isTopicEnd React.PropTypes.bool.isRequired

  :onMore $ \ ()
    controller.topicMore

  :renderTopic $ \ (topic)
    TopicEntry $ {} (:topic topic) (:key $ topic.get :id) (:showLabel true)

  :render $ \ ()
    div ({} (:style $ @styleRoot))
      @props.topics.map @renderTopic
      cond (not @props.isTopicEnd)
        div ({} (:style $ @styleFooter))
          Button $ {} (:text :more) (:onClick @onMore)

  :styleRoot $ \ ()
    {}
      :width :600px
      :flex 1
      :overflowY :auto
      :display :inline-block

  :styleFooter $ \ ()
    {}
      :display :flex
      :justifyContent :flex-start
      :marginTop :10px
      :paddingLeft :10px
