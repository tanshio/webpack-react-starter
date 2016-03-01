gulp         = require 'gulp'

$            = require('gulp-load-plugins')()

config       = require '../../config/config.json'
spritesmith  = require 'gulp.spritesmith'

# スプライト化
gulp.task "sprite", ->
  # スプライトにする画像達
  spriteData = gulp.src config.image.src+"sprites/*.png"
  .pipe(spritesmith(
    imgName: "sprite.png" # Sprite filename
    cssName: "_sprite.scss" # Output scss
    imgPath: "../images/sprite.png" # Output path
    cssFormat: "scss" #format
    cssVarMap: (sprite) ->
      sprite.name = "sprite-" + sprite.name # VarMap
      return
    algorithm: "top-down"
    padding: 10
    retinaSrcFilter: ["*@2x.png"],
    retinaImgName: 'sprite-2x.png'
    retinaDest: config.image.src+"sprites/sprite@2x.png"
  ))
  spriteData.img.pipe gulp.dest(config.image.sprite)
  spriteData.img.pipe gulp.dest("dist/images/sprite") #imgNameで指定したスプライト画像の保存先
  spriteData.css.pipe gulp.dest("app/sass/utilities/") #cssNameで指定したcssの保存先
  return


# Optimize Images
gulp.task "images", ->
  return gulp.src config.image.src+'**/*'
    # .pipe($.changed( pkg.config.dist+'images' ))
    .pipe($.imagemin({
      progressive: true,
      interlaced: true
    }))
    .pipe gulp.dest config.image.dist
    .pipe $.size({title: "images"})

gulp.task "clear", (i_done) ->
  return $.cache.clearAll(i_done);
