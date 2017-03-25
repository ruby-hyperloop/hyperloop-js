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
  File.binwrite 'hyperloop.js', Opal::Builder.build('application').to_s
  File.binwrite 'opal-compiler.js', Opal::Builder.build('opal-compiler').to_s
end

desc 'Minify using uglifier gem'
task :minify do
  js_file = "hyperloop.js"
  js_min_file = "hyperloop.min.js"
  File.open(js_min_file, "w").write(Uglifier.new.compile(File.read(js_file)))

  js_file = "opal-compiler.js"
  js_min_file = "opal-compiler.min.js"
  File.open(js_min_file, "w").write(Uglifier.new.compile(File.read(js_file)))
end
task default: [:build, :minify]
