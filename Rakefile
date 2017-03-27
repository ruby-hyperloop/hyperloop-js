require 'hyperloop-config'
require 'rubygems'
require 'opal-rails'
require 'hyper-operation'
require 'hyper-store'
require 'opal-browser'
require 'opal-jquery'
require 'uglifier'

desc 'Build Hyperloop and Opal Compiler'
task :build do
  Opal.append_path 'hyperloop'
  puts "About to build hyperloop.js"
  File.binwrite 'hyperloop.js', Opal::Builder.build('application').to_s
  puts "done"

  puts "About to build opal-compiler.js"
  File.binwrite 'opal-compiler.js', Opal::Builder.build('opal-compiler').to_s
  puts "done"
end

desc 'Minify using uglifier gem'
task :minify do
  puts "About to build hyperloop.min.js"
  js_file = "hyperloop.js"
  js_min_file = "hyperloop.min.js"
  File.open(js_min_file, "w").write(Uglifier.new.compile(File.read(js_file)))
  puts "done"

  puts "About to build opal-compiler.min.js"
  js_file = "opal-compiler.js"
  js_min_file = "opal-compiler.min.js"
  File.open(js_min_file, "w").write(Uglifier.new.compile(File.read(js_file)))
  puts "done"
end
task default: [:build, :minify]
