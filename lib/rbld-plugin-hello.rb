require 'colorize'
require 'plugman/plugin_base'

module RebuildPlugins
  class HelloPlugin < Plugman::PluginBase
    def start(stream = STDOUT)
      @stream = stream

      banner( 'Hello from Rebuild CLI plugin' )

      # loading command handlers
      require_relative 'rbld-plugin-hello/rbld_hello.rb'

      RbldHelloCommand.stream = stream

      # yiedling means that plugin errored during this notification processing
      # yield
    end

    def command(cmd_name, *args)
      banner( "Hello from Rebuild CLI plugin command '#{cmd_to_s(cmd_name, args)}' handler" )

      # yiedling means that plugin errored during this notification processing
      # yield
    end

    private

    def banner(msg)
      @stream.puts
      @stream.puts msg.green
      @stream.puts
    end

    def cmd_to_s(name, args)
      "#{name}(#{args.join( ', ' )})"
    end
  end
end
