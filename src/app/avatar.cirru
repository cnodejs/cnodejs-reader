
var
  hsl $ require :hsl
  React $ require :react
  Immutable $ require :immutable

var
  ({}~ div) React.DOM

= module.exports $ React.createClass $ {}
  :displayName :app-avatar

  :propTypes $ {}
    :url React.PropTypes.string.isRequired

  :render $ \ ()
    div ({} (:style $ @styleRoot))

  :styleRoot $ \ ()
    {}
      :backgroundImage $ + :url ":(" @props.url ":)"
      :backgroundSize :cover
      :backgroundColor $ hsl 0 0 80
      :width :24px
      :height :24px
