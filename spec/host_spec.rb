require 'spec_helper'
describe ProductSpy::Host do
  describe '#make_pk' do
    it "returns nil if no parser matches" do
      host = ProductSpy::Configuration.instance.hosts[:'amazon.de']
      host.make_pk('http://amazon.de/whatever').should be_nil
    end
  end
end
