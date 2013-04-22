require 'spec_helper'
describe ProductSpy::Host do
  describe '#make_pk' do
    it "returns nil if no parser matches" do
      host = ProductSpy::Configuration.instance.hosts[:'amazon.de']
      host.make_pk('http://amazon.de/whatever').should be_nil
    end
  end

  describe '#build' do
    it 'accepts a block in configuration' do
      ProductSpy.setup do |config|
        config.host 'amazon.de' do |host|
          host.build :defualt do |pk|
            # do something
          end
        end
      end
    end # it

    it 'calls the block if one is given to the build config' do
      called = false
      ProductSpy.setup do |config|
        config.host 'amazon.de' do |host|
          host.build :default do |pk|
            called = true
            pk.should == ['test']
            "new URL: #{pk.first}"
          end
        end
      end
      ProductSpy.build('amazon.de', ['test']).should == "new URL: test"
      called.should == true
    end # it
  end
end
