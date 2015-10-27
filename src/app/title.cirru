
var
  React $ require :react

var
  ({}~ div) React.DOM

= module.exports $ React.createClass $ {}
  :displayName :app-avatar

  :propTypes $ {}
    :title React.PropTypes.string.isRequired

  :renderTitle $ \ ()
    if (isnt document.title @props.title)
      do $ = document.title @props.title
    , undefined

  :render $ \ ()
    @renderTitle

    div ({})
