require 'colorize'
require 'plugman/plugin_base'

module RebuildPlugins
  class HelloPlugin < Plugman::PluginBase
    def start(stream = STDOUT)
      @stream = stream

      banner( 'Hello from Rebuild CLI plugin' )
    end

    private

    def banner(msg)
      @stream.puts
      @stream.puts msg.green
      @stream.puts
    end
  end
end
