
var
  hsl $ require :hsl
  React $ require :react

var
  reset $ require :../util/reset

var
  Space $ React.createFactory $ require :./space
  Button $ React.createFactory $ require :./button
  Content $ React.createFactory $ require :./content

var
  ({}~ div input textarea) React.DOM

= module.exports $ React.createClass $ {}
  :displayName :topic-post

  :propTypes $ {}

  :getInitialState $ \ ()
    {}
      :title :
      :content :
      :showPreview false

  :onTitleChange $ \ (event)
    @setState $ {} (:title event.target.value)

  :onContentChange $ \ (event)
    @setState $ {} (:content event.target.value)

  :onPreview $ \ ()
    @setState $ {} (:showPreview $ not @state.showPreview)

  :onSubmit $ \ ()

  :render $ \ ()
    div ({} (:style $ @styleRoot))
      input $ {} (:value @state.title) (:style $ @styleTitle)
        :onChange @onTitleChange
        :placeholder ":title"
      Space $ {} (:height 10)
      cond @state.showPreview
        div ({} (:style $ @styleWrapper))
          Content $ {} (:text @state.content)
        textarea $ {} (:value @state.content) (:style $ @styleContent)
          :onChange @onContentChange
          :placeholder ":content"
      Space $ {} (:height 10)
      div ({} (:style $ @styleToolbar))
        Button $ {} (:text :preview) (:onClick @onPreview)
        Space $ {} (:width 10)
        Button $ {} (:text :submit) (:onClick @onSubmit)

  :styleRoot $ \ ()
    {}
      :padding ":20px"
      :width 800

  :styleTitle $ \ ()
    {}
      :border $ + ":1px solid " $ hsl 0 0 90
      :outline :none
      :width :100%
      :lineHeight :30px
      :fontSize :14px
      :padding ":0 10px"
      :fontFamily reset.contentFonts

  :styleContent $ \ ()
    {}
      :border $ + ":1px solid " $ hsl 0 0 90
      :outline :none
      :width :100%
      :fontSize :14px
      :lineHeight :1.8em
      :padding ":0 9px"
      :fontFamily reset.codeFonts
      :minHeight :400px
      :paddingTop 13

  :styleToolbar $ \ ()
    {}
      :display :flex
      :justifyContent :flex-end

  :styleWrapper $ \ ()
    {}
      :padding ":0 10px"
