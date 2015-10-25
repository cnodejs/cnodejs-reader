
var
  hsl $ require :hsl
  React $ require :react

var
  reset $ require :../util/reset

var
  ({}~ div) React.DOM

= module.exports $ React.createClass $ {}
  :displayName :app-avatar

  :propTypes $ {}
    :text React.PropTypes.string.isRequired

  :render $ \ ()
    div ({} (:style $ @styleRoot)) @props.text

  :styleRoot $ \ ()
    {}
      :lineHeight :30px
      :color $ hsl 0 0 100
      :fontFamily reset.fashionFonts
      :backgroundColor $ hsl 240 80 80
      :padding ":0 10px"
      :fontSize :12px
