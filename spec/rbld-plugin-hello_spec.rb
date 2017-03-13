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
end

end
