
var
  hsl $ require :hsl
  React $ require :react

var
  reset $ require :../util/reset

var
  Spinner $ React.createFactory $ require :./spinner

var
  ({}~ div span) React.DOM

= module.exports $ React.createClass $ {}
  :displayName :topic-wireframe

  :render $ \ ()
    div ({} (:style $ @styleRoot))
      div ({} (:style $ @styleBox))
        Spinner
        span ({} (:style $ @styleText)) ":Loading topic..."

  :styleRoot $ \ ()
    {}
      :width :800px
      :display :flex
      :justifyContent :center
      :alignItems :center
      :backgroundColor :white

  :styleBox $ \ ()

  :styleText $ \ ()
    {}
      :fontFamily reset.fashionFonts
      :marginTop :20px
      :display :inline-block
      :color $ hsl 0 10 70
      :fontSize :13px
