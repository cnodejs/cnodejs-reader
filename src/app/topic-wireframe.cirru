
var
  React $ require :react

var
  reset $ require :../util/reset

var
  Spinner $ React.createFactory $ require :./spinner

var
  ({}~ div span) React.DOM

= module.exports $ React.createClass $ {}
  :displayName :app-wireframe

  :render $ \ ()
    div ({} (:style $ @styleRoot))
      div ({} (:style $ @styleBox))
        Spinner
        span ({} (:style $ @styleText)) ":Loading topic..."

  :styleRoot $ \ ()
    {}
      :flex 1
      :display :flex
      :justifyContent :center
      :alignItems :center

  :styleBox $ \ ()

  :styleText $ \ ()
    {}
      :fontFamily reset.contentFonts
      :marginTop :20px
      :display :inline-block
