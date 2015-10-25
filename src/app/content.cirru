
var
  React $ require :react

var
  Remarkable $ React.createFactory $ require :react-remarkable

var
  reset $ require :../util/reset
  options $ {}
    :breaks true
    :linkify true

var
  ({}~ div) React.DOM

= module.exports $ React.createClass $ {}
  :displayName :app-avatar

  :propTypes $ {}
    :text React.PropTypes.string.isRequired

  :render $ \ ()
    div ({} (:className :markdown-content) (:style $ @styleRoot))
      Remarkable $ {}
        :source @props.text
        :options options

  :styleRoot $ \ ()
    {}
      :fontFamily reset.contentFonts
      :fontSize :14px
      :lineHeight :1.5em
