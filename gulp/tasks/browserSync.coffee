gulp        = require "gulp"
gulpif      = require "gulp-if"

config      = require "../../config/config.json"

browserSync  = require "browser-Sync"

gulp.task 'browserSync', ->
  browserSync.init
    server:
      baseDir: config.browserSync.server.baseDir
