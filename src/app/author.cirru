
var
  React $ require :react
  Immutable $ require :immutable

var
  Avatar $ React.createFactory $ require :./avatar

var
  ({}~ div) React.DOM

= module.exports $ React.createClass $ {}
  :displayName :app-author

  :propTypes $ {}
    :author $ . (React.PropTypes.instanceOf Immutable.Map) :isRequired

  :render $ \ ()
    div ({} (:style $ @styleRoot))
      Avatar $ {} (:url $ @props.author.get :avatar_url)

  :styleRoot $ \ ()
    {}
