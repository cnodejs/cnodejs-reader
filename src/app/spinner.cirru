
var
  React $ require :react

var
  ({}~ div) React.DOM

= module.exports $ React.createClass $ {}
  :displayName :app-spinner

  :render $ \ ()
    div ({} (:style $ @styleRoot) (:className :spinner))
      div ({} (:className :cube1))
      div ({} (:className :cube2))

  :styleRoot $ \ ()
    {}
