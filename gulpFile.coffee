gulp       = require 'gulp'
autowatch  = require 'gulp-autowatch'
source     = require 'vinyl-source-stream'
buffer     = require 'vinyl-buffer'
cp         = require 'child_process'
stylus     = require 'gulp-stylus'
coffeeify  = require 'coffeeify'
browserify = require 'browserify'
iconFont   = require 'gulp-iconfont'


paths =
  public: './public'
  elm:    './src/elm/*.elm'
  css:    './src/css/*.styl'
  coffee: './src/js/*.coffee'
  font:   './icons'

gulp.task 'coffee', ->
  bCache = {}
  b = browserify './src/js/app.coffee',
    debug: true
    interestGlobals: false
    cache: bCache
    extensions: ['.coffee']
  b.transform coffeeify
  b.bundle()
  .pipe source 'app.js'
  .pipe buffer()
  .pipe gulp.dest paths.public

gulp.task 'stylus', ->
  gulp.src paths.css
  .pipe stylus()
  .pipe gulp.dest paths.public

gulp.task 'elm', ->  
  cmd  = 'elm-make '
  cmd += paths.elm
  cmd += ' --output '
  cmd += './public'
  cmd += '/elm.js'

  cp.exec cmd, (error, stdout) ->
    if error
      console.log "Elm error :^( "
      console.log error
    else
      console.log 'Elm says .. '
      console.log (stdout.slice 0, stdout.length - 1)

gulp.task 'iconfont', ->
  i = iconFont
    fontName: 'ctpaint-icons'
    prependUnicode: true
    formats: [ 'ttf' ]
    timestamp: Math.round (Date.now() / 1000)

  gulp.src [ './icons/*.svg' ]
    .pipe i
    .on 'glyphs', (glyphs) ->
      console.log glyphs
    .pipe (gulp.dest './public')

gulp.task 'watch', ->
  autowatch gulp,
    server:   './public/*.html'
    stylus:   paths.css
    coffee:   paths.coffee
    elm:      paths.elm
    iconfont: paths.font

gulp.task 'server', -> require './server'

gulp.task 'default', 
  [ 'elm', 'coffee', 'stylus', 'watch', 'server', 'iconfont' ]





 