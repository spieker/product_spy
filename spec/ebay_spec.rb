require 'spec_helper'
describe ProductSpy, 'ebay' do
  context 'parse url' do
    it 'parses: http://www.ebay.de/itm/390542152250' do
      host, pk = ProductSpy.parse('http://www.ebay.de/itm/390542152250')
      host.should == 'www.ebay.de'
      pk.should == ['390542152250']
    end

    it 'parses: https://www.ebay.de/itm/390542152250' do
      host, pk = ProductSpy.parse('https://www.ebay.de/itm/390542152250')
      host.should == 'www.ebay.de'
      pk.should == ['390542152250']
    end

    it 'parses: http://www.ebay.de/itm/Inspirierende-Ferienhauser-/390542152250?pt=Sach_Fachb%C3%BCcher&hash=item5aee20523a#ht_500wt_948' do
      host, pk = ProductSpy.parse('http://www.ebay.de/itm/Inspirierende-Ferienhauser-/390542152250?pt=Sach_Fachb%C3%BCcher&hash=item5aee20523a#ht_500wt_948')
      host.should == 'www.ebay.de'
      pk.should == ['390542152250']
    end
  end

  context 'build url' do
    it 'returns: http://www.ebay.de/itm/390542152250' do
      ProductSpy.build('www.ebay.de', ['390542152250']).should == 'http://www.ebay.de/itm/390542152250'
    end
  end
end

