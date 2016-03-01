gulp        = require "gulp"
del         = require "del"

config      = require "../../config/config.json"

gulp.task "clean", ->
  del([config.root.dist])
