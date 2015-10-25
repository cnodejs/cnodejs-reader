
var
  React $ require :react

var
  ({}~ div) React.DOM

= module.exports $ React.createClass $ {}
  :displayName :app-space

  :propTypes $ {}
    :width React.PropTypes.number
    :height React.PropTypes.number

  :render $ \ ()
    div ({} (:style $ @styleRoot))

  :styleRoot $ \ ()
    {}
      :width $ or @props.width :100%
      :height $ or @props.height :1em
