require 'rubygems'
require 'git-version-bump/rake-tasks'
require 'rubygems/tasks'

Gem::Tasks.new

begin
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new(:spec)
rescue LoadError
end

task :lint do
    begin
      require 'travis/yaml'

      puts 'Linting .travis.yml ... No output is good!'
      Travis::Yaml.parse! File.read('.travis.yml')
    rescue LoadError => e
      $stderr.puts "Failed to lint .travis.yml: #{e.message}"
    end
end

task :default => [:spec, :build]
