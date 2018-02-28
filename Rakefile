require 'hyperloop-config'
require 'rubygems'
require 'opal-rails'
require 'hyper-operation'
require 'hyper-store'
require 'hyper-router'
require 'opal-browser'
require 'opal-jquery'
require 'uglifier'

desc 'Build hyperloop-js, hyperloop-compiler.js, hyper-router.js'
task :build do
  Opal.append_path 'hyperloop'

  puts "About to build hyperloop.js"
  File.binwrite 'hyperloop.js', Opal::Builder.build('hyperloop').to_s
  puts "done"

  puts "About to build hyperloop-compiler.js"
  File.binwrite 'hyperloop-compiler.js', Opal::Builder.build('hyperloop-compiler').to_s
  puts "done"

  puts "About to build hyper-router.js"
  File.binwrite 'hyper-router.js', Opal::Builder.build('hyper-router').to_s
  puts "done"

  puts "About to build opal.js"
  File.binwrite 'opal.js', Opal::Builder.build('opal').to_s
  puts "done"
end

desc 'Minify using uglifier gem'
task :minify do

  mkdir 'dist' unless File.directory?('dist')

  puts "About to build hyperloop.min.js"
  js_file = "hyperloop.js"
  js_min_file = "./dist/hyperloop.min.js"
  File.open(js_min_file, "w").write(Uglifier.new(harmony: true).compile(File.read(js_file)))
  puts "done"

  puts "About to build hyperloop-compiler.min.js"
  js_file = "hyperloop-compiler.js"
  js_min_file = "./dist/hyperloop-compiler.min.js"
  File.open(js_min_file, "w").write(Uglifier.new(harmony: true).compile(File.read(js_file)))
  puts "done"

  puts "About to build hyper-router.min.js"
  js_file = "hyper-router.js"
  js_min_file = "./dist/hyper-router.min.js"
  File.open(js_min_file, "w").write(Uglifier.new(harmony: true).compile(File.read(js_file)))
  puts "done"

  puts "About to build opal.min.js"
  js_file = "opal.js"
  js_min_file = "./dist/opal.min.js"
  File.open(js_min_file, "w").write(Uglifier.new(harmony: true).compile(File.read(js_file)))
  puts "done"
end
task default: [:build, :minify]
