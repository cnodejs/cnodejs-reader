doctype

html
  head
    title "CNode 单页面"
    meta (:charset utf-8)
    script(:src build/vendor.min.js)
    link (:rel icon)
     :href https://dn-cnodestatic.qbox.me/public/images/cnode_icon_32.png
    @if (@ dev)
      @block
        link (:rel stylesheet) (:href source/main.css)
        script (:defer) (:src build/main.js)
      @block
        link (:rel stylesheet) (:href build/main.min.css)
        script (:defer) (:src build/main.min.js)
        @insert source/ga.html
  body