gulp        = require "gulp"
browserSync = require "browser-sync"
runSequence = require "run-sequence"
browserSync = require "browser-sync"

config      = require "../../config/config.json"

gulp.task "default", ->
  runSequence "clean", "sprite", ["scss", "js", "images"], "jade", "browserSync", "watch"
  gulp.watch "app/**/*.jade", ["jade"]
  # gulp.watch "app/**/*.scss", ['styleguide']
  gulp.watch "app/**/*.scss", ["scss"]
  gulp.watch "app/**/*.js", ["js"]
