require 'bundler'
Bundler.require(:test, :default)
require "test/unit"

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'grater'
