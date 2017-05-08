'use strict'
fs = require('fs')
stir = require('stir-template')
settings = require('./settings')
resource = require('./resource')
html = stir.html
head = stir.head
title = stir.title
meta = stir.meta
link = stir.link
script = stir.script
body = stir.body
div = stir.div
style = stir.createFactory('style')
gaHtml = fs.readFileSync('src/ga.html', 'utf8')

module.exports = (env) ->
  config = settings.get(env)
  assets = resource.get(config)
  stir.render stir.doctype(),
    html null,
      head null,
        title(null, 'CNode.js'),
        meta(charset: 'utf-8'),
        link(
          rel: 'icon'
          href: 'https://dn-cnodestatic.qbox.me/public/images/cnode_icon_32.png'),
        if assets.style != null
          link(rel: 'stylesheet', href: assets.style)
        else undefined
        script(src: assets.vendor, defer: true),
        script(src: assets.main, defer: true),
        style(null, 'body * {box-sizing: border-box;}'),
      body { style: 'margin: 0;' },
        div(id: 'app')
