
var
  React $ require :react
  Immutable $ require :immutable

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
        Content $ {} (:text $ @props.topic.get :content)
      div ({} (:style $ @styleReplies))

  :styleRoot $ \ ()
    {}
      :display :flex
      :width :1600px

  :styleContent $ \ ()
    {}
      :width :800px

  :styleReplies $ \ ()
    {}
      :width :800px
      :height :100%
      :display :inline-block
