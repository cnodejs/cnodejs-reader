
var call $ \ (f) (f)

= exports.get $ \ (config)
  case config.env
    :dev $ {}
      :vendor $ + config.host :: config.port :/vendor.js
      :main $ + config.host :: config.port :/main.js
      :style null
    :build $ call $ \ ()
      var assets $ require :./assets
      {}
        :main $ . assets.main 0
        :vendor assets.vendor
        :style $ . assets.main 1
