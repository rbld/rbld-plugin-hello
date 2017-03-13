require 'git-version-bump'

Gem::Specification.new do |s|
  s.name        = 'rbld-plugin-hello'
  s.version     = GVB.version
  s.date        = GVB.date
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
  s.add_development_dependency 'git-version-bump', '~> 0.15', '>= 0.15.1'
  s.add_development_dependency 'rubygems-tasks', '~> 0.2', '>= 0.2.4'
  s.add_development_dependency 'rake', '~> 11.2', '>= 11.2.2'

  s.files            = `git ls-files -- lib`.split("\n")
  s.require_path     = 'lib'
end
