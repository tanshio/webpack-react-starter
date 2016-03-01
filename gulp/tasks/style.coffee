gulp         = require "gulp"
gulpif       = require "gulp-if"

$            = require("gulp-load-plugins")()

config       = require "../../config/config.json"

browserSync  = require "browser-Sync"

cssbanner    = ['/*'
  'Theme Name: <%= config.wp.title %>'
  'Theme URI: <%= config.wp.homepage %>'
  'Author: <%= config.wp.author.name %>'
  'Author URI: <%= config.wp.author.url %>'
  'Description: <%= config.wp.description %>'
  'Version: <%= config.wp.version %>'
  'License: GNU General Public License v2 or later'
  'License URI: http://www.gnu.org/licenses/gpl-2.0.html'
  'Text Domain: <%= config.wp.author.name %>'
  'Tags:'
  ''
  'This theme, like WordPress, is licensed under the GPL.'
  'Use it to make something cool, have fun, and share what you\'ve learned with others.'
  ''
  'Resetting and rebuilding styles have been helped along thanks to the fine work of'
  'Eric Meyer http://meyerweb.com/eric/tools/css/reset/index.html'
  'along with Nicolas Gallagher and Jonathan Neal http://necolas.github.com/normalize.css/'
  'and Blueprint http://www.blueprintcss.org/'
  '*/'].join('\n')

# SCSS
# lissass
gulp.task 'scss', ->
  gulp.src(config.scss.src+"style.scss")
    .pipe $.plumber
      errorHandler: $.notify.onError "<%= error.message %>"
    .pipe($.sass({
      includePaths: require('node-neat').includePaths
    }))
    .pipe $.pleeease(
      "autoprefixer": { "browsers": ["ie 9"] },
      "rem": false,
    )
    .pipe gulp.dest config.scss.dist
    .on "end" , browserSync.stream



# stylus
gulp.task "stylus", ->
  gulp.src config.stylus.app+"stylus/style.styl"
  .pipe $.plumber
    errorHandler: $.notify.onError "<%= error.message %>"
  .pipe $.stylus
    compress: true
  .pipe $.pleeease
    "autoprefixer": { "browsers": ["ie 9"] },
    "rem": false,

  .pipe gulp.dest config.stylus.dist+"style"
  .on 'end' , browserSync.stream
