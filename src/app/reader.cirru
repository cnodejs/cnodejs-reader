
var
  React $ require :react
  Immutable $ require :immutable

var
  TopicList $ React.createFactory $ require :./topic-list

var
  ({}~ div) React.DOM

= module.exports $ React.createClass $ {}
  :displayName :app-reader

  :propTypes $ {}
    :store $ . (React.PropTypes.instanceOf Immutable.Map) :isRequired

  :render $ \ ()
    div ({} (:style $ @styleRoot))
      TopicList $ {} (:topics $ @props.store.get :topics)

  :styleRoot $ \ ()
    {}
