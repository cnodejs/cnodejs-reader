
var
  webpack $ require :webpack
  config $ require :./webpack.config
  fs $ require :fs
  ExtractTextPlugin $ require :extract-text-webpack-plugin

= module.exports $ {}
  :entry $ {}
    :main $ [] :./src/main
    :vendor $ []

  :output $ {}
    :path :build/
    :filename :[name].[chunkhash:8].js

  :resolve config.resolve
  :module $ {}
    :loaders $ []
      {} (:test /\.cirru$) (:loader :cirru-script) (:ignore /node_modules)
      {} (:test "/\.(png|jpg)$") (:loader :url-loader)
        :query $ {} (:limit 100)
      {} (:test /\.css$) $ :loader
        ExtractTextPlugin.extract :style-loader :css!autoprefixer

  :plugins $ []
    new webpack.optimize.CommonsChunkPlugin :vendor :vendor.[chunkhash:8].js
    new ExtractTextPlugin :style.[chunkhash:8].css
    new webpack.optimize.UglifyJsPlugin $ {} (:sourceMap false)
    \ ()
      this.plugin :done $ \ (stats)
        var
          json $ stats.toJson
          content $ JSON.stringify json.assetsByChunkName null 2
        return $ fs.writeFileSync :build/assets.json content
