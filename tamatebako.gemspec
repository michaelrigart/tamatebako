# Ensure we require the local version and not one we might have installed already
require File.join([File.dirname(__FILE__),'lib','tamatebako_version.rb'])
spec = Gem::Specification.new do |s|
  s.name = 'tamatebako'
  s.version = Tamatebako::VERSION
  s.author = 'Michael Rigart'
  s.email = 'michael@netronix.be'
  s.homepage = 'http://www.lone-gunman.be'
  s.platform = Gem::Platform::RUBY
  s.summary = 'Small toolbox'
# Add your other files here if you make them
  s.files = %w(
bin/tamatebako
lib/tamatebako_version.rb
  )
  s.require_paths << 'lib'
  s.has_rdoc = true
  s.extra_rdoc_files = ['README.rdoc','tamatebako.rdoc']
  s.rdoc_options << '--title' << 'tamatebako' << '--main' << 'README.rdoc' << '-ri'
  s.bindir = 'bin'
  s.executables << 'tamatebako'
  s.add_development_dependency('rake')
  s.add_development_dependency('rdoc')
  s.add_runtime_dependency('gli')
  s.add_runtime_dependency('curb')
  s.add_runtime_dependency('nokogiri')
  s.add_runtime_dependency('socksify')
  s.add_runtime_dependency('bcrypt-ruby')
end
