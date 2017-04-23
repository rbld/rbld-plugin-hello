require 'colorize'

module RebuildPlugins
  class RbldHelloCommand < Rebuild::CLI::Command
    def usage
      banner( :usage )
    end

    def run(parameters)
      banner( :run )
    end

    class << self
      attr_accessor :stream
    end

    private

    def self.banner(method)
      @stream.puts
      @stream.puts "Hello from rbld hello '#{method}' handler".yellow
      @stream.puts
    end

    def banner(method)
      self.class.banner( method )
    end
  end
end
