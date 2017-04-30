require 'rubygems'
require 'rubygems/tasks'
require 'rspec/core/rake_task'

Gem::Tasks.new
RSpec::Core::RakeTask.new(:spec)

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
