gulp        = require "gulp"
gulpif      = require 'gulp-if'

gulp.task "watch", ->
  gulp.watch "app/**/*.jade", ["jade"]
  # gulp.watch "app/**/*.scss", ['styleguide']
  gulp.watch "app/**/*.scss", ["scss"]
  gulp.watch ["app/**/*.js","app/**/*.jsx"], ["js"]
