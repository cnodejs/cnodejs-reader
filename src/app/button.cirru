
var
  hsl $ require :hsl
  React $ require :react

var
  reset $ require :../util/reset

var
  ({}~ div) React.DOM

= module.exports $ React.createClass $ {}
  :displayName :app-button

  :propTypes $ {}
    :text React.PropTypes.string.isRequired
    :onClick React.PropTypes.func.isRequired

  :onClick $ \ (event)
    event.stopPropagation
    @props.onClick event

  :render $ \ ()
    div ({} (:style $ @styleRoot) (:onClick @onClick)) @props.text

  :styleRoot $ \ ()
    {}
      :padding ":0 10px"
      :fontFamily reset.fashionFonts
      :fontSize :14px
      :backgroundColor $ hsl 240 80 80
      :lineHeight :30px
      :color :white
