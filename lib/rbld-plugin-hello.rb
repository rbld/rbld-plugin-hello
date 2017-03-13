require 'colorize'
require 'plugman/plugin_base'

module RebuildPlugins
  class HelloPlugin < Plugman::PluginBase
    def start(stream = STDOUT)
      stream.puts
      stream.puts 'Hello from Rebuild CLI plugin'.green
      stream.puts
    end
  end
end
