require 'plugman'

module Rebuild
  module CLI
    class Command
    end
  end
end

module RebuildPlugins

describe "HelloPlugin" do
  before(:all) do
    loader = ->(a) { require_relative '../lib/rbld-plugin-hello' }
    @plugman = Plugman.new(loader: loader)
    @plugman.load_plugins
  end

  let(:stream) { instance_double(IO) }

  it 'prints greeting on start' do
    allow(stream).to receive(:puts)
    expect(stream).to receive(:puts).with(/Hello/)
    @plugman.notify(:start, stream)
  end

  it 'prints greeting on known command' do
    allow(stream).to receive(:puts)
    @plugman.notify(:start, stream)
    regex = Regexp.escape('command \'test_command(test_arg1, test_arg2)\' handler')
    expect(stream).to receive(:puts).with(Regexp.new( regex ))
    @plugman.notify(:command, 'test_command', :test_arg1, :test_arg2)
  end
end

end
