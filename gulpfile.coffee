"use strict"

# Gulp Setup
#
# 1. Settings & variables
# 2. Jade
# 3. JavaScript
# 4. StyleSheet
# 5. Images
# 6. StyleGuide
# 7. WordPress
# 8. Tasks

#****************************
# 1. Settings
#****************************


gulp         = require 'gulp'
minimist     = require 'minimist'
gutil        = require 'gulp-util'

minimistOption =
  string: 'env',
  default:
    env: process.env.NODE_ENV || 'development'

options = minimist(process.argv.slice(2), minimistOption)

isProduction = false
if(options.env == 'production')
  isProduction = true

gutil.log '[env]', gutil.colors.yellow(options.env), '[isProduction]', gutil.colors.yellow(isProduction)

requireDir = require('require-dir');
requireDir("./gulp/tasks", { recurse: true });
