gulp         = require "gulp"

$            = require("gulp-load-plugins")()

config       = require "../../config/config.json"
data         = require "../../config/data.json"

jade         = require "gulp-jade"

browserSync  = require "browser-Sync"

gulp.task "jade", ->
  YOUR_LOCALS = {}
  gulp.src [
    config.jade.src+"**/*.jade",
    "!"+config.jade.src+"include/**/*.jade",
    "!"+config.jade.src+"**/_*.jade"
  ]
  .pipe $.plumber(
    errorHandler: $.notify.onError "<%= error.message %>"
  )
  .pipe $.data (file)->
    if file
      root = process.cwd()
      origin = file.path;
      textAfter = origin.replace root+"/"+config.jade.src,""
      path = textAfter.replace ".jade",""
      if data[path]
        console.log(data[path])
        return {
          "title":data[path]["title"],
          "keyword":data[path]["keyword"],
          "desc":data[path]["desc"],"path":path
        }


      else
        return {
          "title":null,
          "keyword":null,
          "desc":null
        }


  .pipe $.jade
    pretty: true
  .pipe gulp.dest config.jade.dist
  .on "end" , browserSync.reload
