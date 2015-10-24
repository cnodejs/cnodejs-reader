
var
  React $ require :react
  Immutable $ require :immutable

var
  TopicEntry $ React.createFactory $ require :./topic-entry

var
  ({}~ div) React.DOM

= module.exports $ React.createClass $ {}
  :displayName :topic-list

  :propTypes $ {}
    :topics $ . (React.PropTypes.instanceOf Immutable.List) :isRequired

  :renderTopic $ \ (topic)
    TopicEntry $ {} (:topic topic) (:key $ topic.get :id)

  :render $ \ ()
    div ({} (:style $ @styleRoot))
      @props.topics.map @renderTopic

  :styleRoot $ \ ()
    {}
      :width :50%
      :height :100%
      :overflowY :auto
