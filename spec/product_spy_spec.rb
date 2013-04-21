require 'spec_helper'
describe ProductSpy do
  describe '#parse' do
    it "returns nil if no configured host matches the url" do
      ProductSpy.parse('http://no.host/whatever').should be_nil
    end

    it "returns nil if no url is given" do
      ProductSpy.parse('').should be_nil
      ProductSpy.parse(nil).should be_nil
    end
  end
end
