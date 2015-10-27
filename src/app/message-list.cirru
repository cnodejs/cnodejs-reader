
var
  hsl $ require :hsl
  React $ require :react
  Immutable $ require :immutable

var
  ({}~ div) React.DOM

= module.exports $ React.createClass $ {}
  :displayName :message-list

  :propTypes $ {}
    :messages $ . (React.PropTypes.instanceOf Immutable.List) :isRequired

  :render $ \ ()
    div ({} (:style $ @styleRoot))

  :styleRoot $ \ ()
    {}
