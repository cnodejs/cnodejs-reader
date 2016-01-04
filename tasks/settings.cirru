
= exports.get $ \ (env)
  case env
    :dev $ {}
      :env :dev
      :host :http://repo
      :port 8080
    :build $ {}
      :env :build
      :host :http://repo
      :port 8080
