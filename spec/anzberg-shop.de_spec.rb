require 'spec_helper'
      # http://www.arzberg-shop.de/product_info.php/(info/p9845_Kuchenplatte-eckig-35-cm------1382--Weiss.html)
describe ProductSpy, 'anzberg-shop.de' do
  context 'parse url' do
    it 'parses: https://www.arzberg-shop.de/product_info.php/info/p9845_Kuchenplatte-eckig-35-cm------1382--Weiss.html' do
      host, pk = ProductSpy.parse('https://www.arzberg-shop.de/product_info.php/info/p9845_Kuchenplatte-eckig-35-cm------1382--Weiss.html')
      host.should == 'www.arzberg-shop.de'
      pk.should == ['info/p9845_Kuchenplatte-eckig-35-cm------1382--Weiss.html']
    end

    it 'parses: http://www.arzberg-shop.de/product_info.php/info/p9845_Kuchenplatte-eckig-35-cm------1382--Weiss.html' do
      host, pk = ProductSpy.parse('http://www.arzberg-shop.de/product_info.php/info/p9845_Kuchenplatte-eckig-35-cm------1382--Weiss.html')
      host.should == 'www.arzberg-shop.de'
      pk.should == ['info/p9845_Kuchenplatte-eckig-35-cm------1382--Weiss.html']
    end

    it 'parses: http://www.arzberg-shop.de/product_info.php/info/p9845_Kuchenplatte-eckig-35-cm------1382--Weiss.html?x=y' do
      host, pk = ProductSpy.parse('http://www.arzberg-shop.de/product_info.php/info/p9845_Kuchenplatte-eckig-35-cm------1382--Weiss.html?x=y')
      host.should == 'www.arzberg-shop.de'
      pk.should == ['info/p9845_Kuchenplatte-eckig-35-cm------1382--Weiss.html']
    end
  end

  context 'build url' do
    it 'returns: http://www.arzberg-shop.de/product_info.php/info/p9845_Kuchenplatte-eckig-35-cm------1382--Weiss.html' do
      ProductSpy.build('www.arzberg-shop.de', ['info/p9845_Kuchenplatte-eckig-35-cm------1382--Weiss.html']).should == 'http://www.arzberg-shop.de/product_info.php/info/p9845_Kuchenplatte-eckig-35-cm------1382--Weiss.html'
    end
  end
end
