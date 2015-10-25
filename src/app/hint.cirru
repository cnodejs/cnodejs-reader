
var
  hsl $ require :hsl
  React $ require :react

var
  reset $ require :../util/reset

var
  ({}~ div) React.DOM

= module.exports $ React.createClass $ {}
  :displayName :app-hint

  :propTypes $ {}
    :text React.PropTypes.string.isRequired

  :render $ \ ()
    div ({} (:style $ @styleRoot)) @props.text

  :styleRoot $ \ ()
    {}
      :lineHeight :20px
      :height :20px
      :color $ hsl 0 0 100
      :fontFamily reset.fashionFonts
      :backgroundColor $ hsl 240 80 90
      :padding ":0 10px"
      :fontSize :12px
