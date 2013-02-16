require 'spec_helper'
describe ProductSpy, 'hornbach.de' do
  context 'parse url' do
    it 'parses: https://www.hornbach.de/shop/HORNBACH-Projektbuch/7395450/artikel.html' do
      host, pk = ProductSpy.parse('https://www.hornbach.de/shop/HORNBACH-Projektbuch/7395450/artikel.html')
      host.should == 'www.hornbach.de'
      pk.should == ['HORNBACH-Projektbuch', '7395450']
    end

    it 'parses: http://www.hornbach.de/shop/HORNBACH-Projektbuch/7395450/artikel.html' do
      host, pk = ProductSpy.parse('http://www.hornbach.de/shop/HORNBACH-Projektbuch/7395450/artikel.html')
      host.should == 'www.hornbach.de'
      pk.should == ['HORNBACH-Projektbuch', '7395450']
    end

    it 'parses: http://www.hornbach.de/shop/HORNBACH-Projektbuch/7395450/artikel.html?sourceCat=S1405&WT.svl=artikel_text' do
      host, pk = ProductSpy.parse('http://www.hornbach.de/shop/HORNBACH-Projektbuch/7395450/artikel.html?sourceCat=S1405&WT.svl=artikel_text')
      host.should == 'www.hornbach.de'
      pk.should == ['HORNBACH-Projektbuch', '7395450']
    end
  end

  context 'build url' do
    it 'returns: https://www.hornbach.de/shop/HORNBACH-Projektbuch/7395450/artikel.html' do
      ProductSpy.build('www.hornbach.de', ['HORNBACH-Projektbuch', '7395450']).should == 'https://www.hornbach.de/shop/HORNBACH-Projektbuch/7395450/artikel.html'
    end
  end
end
