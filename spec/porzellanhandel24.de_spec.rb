require 'spec_helper'
describe ProductSpy, 'porzellanhandel24.de' do
  context 'parse url' do
    it 'parses: https://www.porzellanhandel24.de/villeroy-boch-royal-becher-mit-henkel/' do
      host, pk = ProductSpy.parse('https://www.porzellanhandel24.de/villeroy-boch-royal-becher-mit-henkel/')
      host.should == 'www.porzellanhandel24.de'
      pk.should == ['villeroy-boch-royal-becher-mit-henkel']
    end

    it 'parses: http://www.porzellanhandel24.de/villeroy-boch-royal-becher-mit-henkel/' do
      host, pk = ProductSpy.parse('http://www.porzellanhandel24.de/villeroy-boch-royal-becher-mit-henkel/')
      host.should == 'www.porzellanhandel24.de'
      pk.should == ['villeroy-boch-royal-becher-mit-henkel']
    end

    it 'parses: http://www.porzellanhandel24.de/villeroy-boch-royal-becher-mit-henkel' do
      host, pk = ProductSpy.parse('http://www.porzellanhandel24.de/villeroy-boch-royal-becher-mit-henkel')
      host.should == 'www.porzellanhandel24.de'
      pk.should == ['villeroy-boch-royal-becher-mit-henkel']
    end
    
    it 'parses: http://www.porzellanhandel24.de/villeroy-boch-royal-becher-mit-henkel/?refID=froogle&gclid=CL7Z-K63zrQCFXHLtAodTVoA5w' do
      host, pk = ProductSpy.parse('http://www.porzellanhandel24.de/villeroy-boch-royal-becher-mit-henkel/?refID=froogle&gclid=CL7Z-K63zrQCFXHLtAodTVoA5w')
      host.should == 'www.porzellanhandel24.de'
      pk.should == ['villeroy-boch-royal-becher-mit-henkel']
    end

    it 'parses: http://www.porzellanhandel24.de/villeroy-boch-royal-becher-mit-henkel?refID=froogle&gclid=CL7Z-K63zrQCFXHLtAodTVoA5w' do
      host, pk = ProductSpy.parse('http://www.porzellanhandel24.de/villeroy-boch-royal-becher-mit-henkel?refID=froogle&gclid=CL7Z-K63zrQCFXHLtAodTVoA5w')
      host.should == 'www.porzellanhandel24.de'
      pk.should == ['villeroy-boch-royal-becher-mit-henkel']
    end
  end

  context 'build url' do
    it 'returns: https://www.porzellanhandel24.de/villeroy-boch-royal-becher-mit-henkel' do
      ProductSpy.build('www.porzellanhandel24.de', ['villeroy-boch-royal-becher-mit-henkel']).should == 'https://www.porzellanhandel24.de/villeroy-boch-royal-becher-mit-henkel'
    end
  end
end
