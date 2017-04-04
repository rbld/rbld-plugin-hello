require 'plugman'

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
    regex = Regexp.escape('known command test_command(test_arg1, test_arg2)')
    expect(stream).to receive(:puts).with(Regexp.new( regex ))
    @plugman.notify(:command, 'test_command', :test_arg1, :test_arg2)
  end

  it 'prints greeting on unknown command' do
    allow(stream).to receive(:puts)
    @plugman.notify(:start, stream)
    regex = Regexp.escape('unknown command test_command(test_arg1, test_arg2)')
    expect(stream).to receive(:puts).with(Regexp.new( regex ))
    @plugman.notify(:unknown_command, 'test_command', :test_arg1, :test_arg2) {}
  end

  it 'yields in unknown command processing' do
    allow(stream).to receive(:puts)
    @plugman.notify(:start, stream)
    expect { |b| @plugman.notify(:unknown_command, 'test_command', &b) }.to yield_control
  end
end

end
