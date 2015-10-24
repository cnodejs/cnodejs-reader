
var
  gulp $ require :gulp
  sequence $ require :run-sequence
  exec $ . (require :child_process) :exec
  env $ object
    :dev true
    :main :http://192.168.0.129:8080/build/main.js
    :vendor :http://192.168.0.129:8080/build/vendor.js
    :style :http://192.168.0.129:8080/build/style.css

gulp.task :rsync $ \ (cb)
  var
    wrapper $ require :rsyncwrapper
  wrapper.rsync
    object
      :ssh true
      :src $ array :index.html :build
      :recursive true
      :args $ array :--verbose
      :dest :tiye:~/repo/workflow/
      :deleteAll true
    \ (error stdout stderr cmd)
      if (? error)
        do $ throw error
      console.error stderr
      console.log cmd
      cb

gulp.task :script $ \ ()
  var
    script $ require :gulp-cirru-script

  ... gulp
    src :src/*.cirru
    pipe $ script
    pipe $ gulp.dest :lib/

gulp.task :html $ \ (cb)
  var
    html $ require :./template
    fs $ require :fs
    assets
  if (not env.dev) $ do
    = assets $ require :./build/assets.json
    = env.main $ + :./build/ $ . assets.main 0
    = env.style $ + :./build/ $ . assets.main 1
    = env.vendor $ + :./build/ assets.vendor
  fs.writeFile :index.html (html env) cb

gulp.task :del $ \ (cb)
  var
    del $ require :del
  del (array :build) cb

gulp.task :webpack $ \ (cb)
  var
    command $ cond env.dev :webpack ":webpack --config webpack.min.cirru --progress"
  exec command $ \ (err stdout stderr)
    console.log stdout
    console.log stderr
    cb err

gulp.task :build $ \ (cb)
  = env.dev false
  sequence :del :webpack :html cb
