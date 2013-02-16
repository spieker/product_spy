require 'spec_helper'
describe ProductSpy, 'lecreuset.de' do
  context 'parse url' do
    it 'parses: https://www.lecreuset.de/Produkte-/Gusseisen/Klassische-Brater/Brater-Tradition-rund-24cm/' do
      host, pk = ProductSpy.parse('https://www.lecreuset.de/Produkte-/Gusseisen/Klassische-Brater/Brater-Tradition-rund-24cm/')
      host.should == 'www.lecreuset.de'
      pk.should == ['Gusseisen/Klassische-Brater/Brater-Tradition-rund-24cm']
    end

    it 'parses: http://www.lecreuset.de/Produkte-/Gusseisen/Klassische-Brater/Brater-Tradition-rund-24cm/' do
      host, pk = ProductSpy.parse('http://www.lecreuset.de/Produkte-/Gusseisen/Klassische-Brater/Brater-Tradition-rund-24cm/')
      host.should == 'www.lecreuset.de'
      pk.should == ['Gusseisen/Klassische-Brater/Brater-Tradition-rund-24cm']
    end

    it 'parses: http://www.lecreuset.de/Produkte-/Gusseisen/Klassische-Brater/Brater-Tradition-rund-24cm' do
      host, pk = ProductSpy.parse('http://www.lecreuset.de/Produkte-/Gusseisen/Klassische-Brater/Brater-Tradition-rund-24cm')
      host.should == 'www.lecreuset.de'
      pk.should == ['Gusseisen/Klassische-Brater/Brater-Tradition-rund-24cm']
    end
    
    it 'parses: http://www.lecreuset.de/Produkte-/Gusseisen/Klassische-Brater/Brater-Tradition-rund-24cm/?x=y' do
      host, pk = ProductSpy.parse('http://www.lecreuset.de/Produkte-/Gusseisen/Klassische-Brater/Brater-Tradition-rund-24cm/?x=y')
      host.should == 'www.lecreuset.de'
      pk.should == ['Gusseisen/Klassische-Brater/Brater-Tradition-rund-24cm']
    end

    it 'parses: http://www.lecreuset.de/Produkte-/Gusseisen/Klassische-Brater/Brater-Tradition-rund-24cm?x=y' do
      host, pk = ProductSpy.parse('http://www.lecreuset.de/Produkte-/Gusseisen/Klassische-Brater/Brater-Tradition-rund-24cm?x=y')
      host.should == 'www.lecreuset.de'
      pk.should == ['Gusseisen/Klassische-Brater/Brater-Tradition-rund-24cm']
    end
  end

  context 'build url' do
    it 'returns: http://www.lecreuset.de/Produkte-/Gusseisen/Klassische-Brater/Brater-Tradition-rund-24cm' do
      ProductSpy.build('www.lecreuset.de', ['Gusseisen/Klassische-Brater/Brater-Tradition-rund-24cm']).should == 'http://www.lecreuset.de/Produkte-/Gusseisen/Klassische-Brater/Brater-Tradition-rund-24cm/'
    end
  end
end
