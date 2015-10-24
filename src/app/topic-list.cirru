
var
  React $ require :react
  Immutable $ require :immutable

var
  ({}~ div) React.DOM

= module.exports $ React.createClass $ {}
  :displayName :topic-list

  :propTypes $ {}
    :topics $ . (React.PropTypes.instanceOf Immutable.List) :isRequired

  :renderTopic $ \ (topic)
    topic.get :title

  :render $ \ ()
    div ({} (:style $ @styleRoot))
      @props.topics.map @renderTopic

  :styleRoot $ \ ()
    {}
