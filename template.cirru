
var
  fs $ require :fs
  stir $ require :stir-template
  ({}~ html head title meta link script body div) stir

var style $ stir.createFactory :style
var gaHtml $ fs.readFileSync :src/ga.html :utf8

= module.exports $ \ (data)
  stir.render
    stir.doctype
    html null
      head null
        title null :CNode.js
        meta $ {} (:charset :utf-8)
        link $ {} (:rel :icon)
          :href :https://dn-cnodestatic.qbox.me/public/images/cnode_icon_32.png
        cond (not data.dev)
          link $ {} (:rel :stylesheet) (:href data.style)
        cond (not data.dev) gaHtml
        script $ {} (:src data.vendor) (:defer true)
        script $ {} (:src data.main) (:defer true)
        style null ":body * {box-sizing: border-box;}"
      body ({} (:style ":margin: 0;"))
        div $ {} (:id :app)
