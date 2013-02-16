require 'spec_helper'
describe ProductSpy, 'baby-walz.de' do
  context 'parse url' do
    it 'parses: https://www.baby-walz.de/Rassel-Soeckchen-321588.html' do
      host, pk = ProductSpy.parse('https://www.baby-walz.de/Rassel-Soeckchen-321588.html')
      host.should == 'www.baby-walz.de'
      pk.should == ['Rassel-Soeckchen-321588']
    end

    it 'parses: http://www.baby-walz.de/Rassel-Soeckchen-321588.html' do
      host, pk = ProductSpy.parse('http://www.baby-walz.de/Rassel-Soeckchen-321588.html')
      host.should == 'www.baby-walz.de'
      pk.should == ['Rassel-Soeckchen-321588']
    end

    it 'parses: http://www.baby-walz.de/Rassel-Soeckchen-321588.html?group=3020165&pgpkl=cad489c2d189d388b31a2206fd609664' do
      host, pk = ProductSpy.parse('http://www.baby-walz.de/Rassel-Soeckchen-321588.html?group=3020165&pgpkl=cad489c2d189d388b31a2206fd609664')
      host.should == 'www.baby-walz.de'
      pk.should == ['Rassel-Soeckchen-321588']
    end
  end

  context 'build url' do
    it 'returns: https://www.baby-walz.de/Rassel-Soeckchen-321588.html' do
      ProductSpy.build('www.baby-walz.de', ['Rassel-Soeckchen-321588']).should == 'https://www.baby-walz.de/Rassel-Soeckchen-321588.html'
    end
  end
end
