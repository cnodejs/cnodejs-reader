
var
  React $ require :react
  hljs $ require :highlight.js

var
  Remarkable $ React.createFactory $ require :react-remarkable

var
  reset $ require :../util/reset
  options $ {}
    :breaks true
    :html true
    :linkify true
    :highlight $ \ (code lang)
      var result $ hljs.highlightAuto code
      , result.value

var
  ({}~ div) React.DOM

= module.exports $ React.createClass $ {}
  :displayName :app-content

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
      :fontSize :15px
      :lineHeight :1.8em
