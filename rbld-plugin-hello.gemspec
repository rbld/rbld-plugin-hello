require 'gitv'

Gem::Specification.new do |s|
  gitv = GitV.new

  s.name        = 'rbld-plugin-hello'
  s.version     = gitv.version
  s.author      = 'Dmitry Fleytman'
  s.description = 'Sample plugin for Rebuild CLI'
  s.summary     = "rbld-plugin-hello-#{s.version}"
  s.email       = 'rbld-devel@rbld.io'
  s.license     = 'Apache-2.0'
  s.homepage    = 'http://rbld.io/'
  s.platform    = Gem::Platform::RUBY
  s.required_ruby_version = '>= 2.0.0'

  s.add_runtime_dependency 'colorize', '~> 0.8.1'
  s.add_runtime_dependency 'plugman', '~> 1.0', '>= 1.0.2'

  s.add_development_dependency 'travis', '~> 1.8', '>= 1.8.2'
  s.add_development_dependency 'rspec', '~> 3.5', '>= 3.5.0'
  s.add_development_dependency 'gitv', '~> 0.0', '>= 0.0.3'
  s.add_development_dependency 'rubygems-tasks', '~> 0.2', '>= 0.2.4'
  s.add_development_dependency 'rake', '~> 11.2', '>= 11.2.2'
  s.add_development_dependency 'license_finder', '~> 3.0', '>= 3.0.0'

  s.files            = `git ls-files -- lib`.split("\n") + [ gitv.cache ]
  s.require_path     = 'lib'
end
