
var
  fs $ require :fs
  webpack $ require :webpack

var
  nodeModules $ {}

... fs
  readdirSync :node_modules
  filter $ \ (x)
    is (... ([] :.bin) (indexOf x)) -1
  forEach $ \ (mod)
    = (. nodeModules mod) (+ ":commonjs " mod)

= module.exports $ {}
  :entry $ [] :webpack/hot/poll?1000 :./src/server
  :target :node
  :output $ {}
    :path :build/
    :filename :bundle.js
  :externals nodeModules
  :module $ {}
    :loaders $ []
      {} (:test /\.cirru) (:loader :cirru-script)
  :plugins $ []
    new webpack.HotModuleReplacementPlugin
  :resolve $ {}
    :extensions $ [] :.js : :.cirru
  :plugins $ []
    new webpack.HotModuleReplacementPlugin
