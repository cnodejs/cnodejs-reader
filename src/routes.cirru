
var
  pathUtil $ require :router-view/lib/path

= module.exports $ pathUtil.expandRoutes $ []
  [] :home :/
  [] :topic :/topic/:id
  [] :user :/user/:id
  [] :message :/message
