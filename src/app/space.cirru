
var
  React $ require :react

var
  ({}~ div) React.DOM

= module.exports $ React.createClass $ {}
  :displayName :app-avatar

  :propTypes $ {}
    :width React.PropTypes.number.isRequired

  :render $ \ ()
    div ({} (:style $ @styleRoot))

  :styleRoot $ \ ()
    {}
      :width @props.width
      :height :1em
