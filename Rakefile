require 'rake/testtask'
require 'rubygems/package_task'

PKG_FILES = Dir['Rakefile', 'README.md', 'lib/**', 'test/**']
PKG_VERSION = '0.1'

spec = Gem::Specification.new do |s|
  s.platform = Gem::Platform::RUBY
  s.summary = 'Make GraphViz graphs out of simple Ruby objects'
  s.name = 'gritty'
  s.version = PKG_VERSION
  s.authors = 'Ian Dees'
  s.email = 'undees@gmail.com'
  s.homepage = 'https://github.com/undees/gritty'
  s.require_path = 'lib'
  s.files = PKG_FILES
  s.description = <<-EOF
This library makes GraphViz graphs out of Ruby objects, for very simple Ruby objects.  It uses Ryan Davis's Graph gem under the hood.  Pretty-print + Graph = Gritty.
  EOF
  s.add_runtime_dependency 'graph', '~> 2.5'
end

Gem::PackageTask.new(spec) do |pkg|
end

Rake::TestTask.new do |t|
end
