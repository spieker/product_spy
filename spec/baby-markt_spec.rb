require 'spec_helper'
describe ProductSpy, 'baby-markt' do
  context 'parse url' do
    it 'parses: https://www.baby-markt.de/Markenhersteller/Reer/Heizstrahler/REER-1909-Wickeltisch-Heizstrahler-mit-Standfuss.html' do
      host, pk = ProductSpy.parse('https://www.baby-markt.de/Markenhersteller/Reer/Heizstrahler/REER-1909-Wickeltisch-Heizstrahler-mit-Standfuss.html')
      host.should == 'www.baby-markt.de'
      pk.should == ['/Markenhersteller/Reer/Heizstrahler/REER-1909-Wickeltisch-Heizstrahler-mit-Standfuss.html']
    end

    it 'parses: http://www.baby-markt.de/Markenhersteller/Reer/Heizstrahler/REER-1909-Wickeltisch-Heizstrahler-mit-Standfuss.html' do
      host, pk = ProductSpy.parse('http://www.baby-markt.de/Markenhersteller/Reer/Heizstrahler/REER-1909-Wickeltisch-Heizstrahler-mit-Standfuss.html')
      host.should == 'www.baby-markt.de'
      pk.should == ['/Markenhersteller/Reer/Heizstrahler/REER-1909-Wickeltisch-Heizstrahler-mit-Standfuss.html']
    end

    it 'parses: http://www.baby-markt.de/Markenhersteller/Reer/Heizstrahler/REER-1909-Wickeltisch-Heizstrahler-mit-Standfuss.html?x=y' do
      host, pk = ProductSpy.parse('http://www.baby-markt.de/Markenhersteller/Reer/Heizstrahler/REER-1909-Wickeltisch-Heizstrahler-mit-Standfuss.html?x=y')
      host.should == 'www.baby-markt.de'
      pk.should == ['/Markenhersteller/Reer/Heizstrahler/REER-1909-Wickeltisch-Heizstrahler-mit-Standfuss.html']
    end
  end

  context 'build url' do
    it 'returns: https://www.baby-markt.de/Markenhersteller/Reer/Heizstrahler/REER-1909-Wickeltisch-Heizstrahler-mit-Standfuss.html' do
      ProductSpy.build('www.baby-markt.de', ['/Markenhersteller/Reer/Heizstrahler/REER-1909-Wickeltisch-Heizstrahler-mit-Standfuss.html']).should == 'https://www.baby-markt.de/Markenhersteller/Reer/Heizstrahler/REER-1909-Wickeltisch-Heizstrahler-mit-Standfuss.html'
    end
  end
end
