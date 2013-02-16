require 'spec_helper'
describe ProductSpy, 'amazon' do
  context 'parse url' do
    it 'parses: https://www.amazon.de/dp/B000K7BELW' do
      host, pk = ProductSpy.parse('https://www.amazon.de/dp/B000K7BELW')
      host.should == 'www.amazon.de'
      pk.should == ['B000K7BELW']
    end
    
    it 'parses: https://www.amazon.de/dp/B000K7BELW/' do
      host, pk = ProductSpy.parse('https://www.amazon.de/dp/B000K7BELW/')
      host.should == 'www.amazon.de'
      pk.should == ['B000K7BELW']
    end

    it 'parses: http://www.amazon.de/gp/aw/d/B004O9DF6O/ref=s9_simh_awgw_d1_g200_i0/279-4049004-9468652?aid=aw_gw&apid=317822427&arc=1201&arid=13W5CTR69XS38DGRS4HQ&asn=center-6&pf_rd_i=aw_gw&pf_rd_m=A3JWKAKR8XB7XF&pf_rd_p=317822427&pf_rd_r=13W5CTR69XS38DGRS4HQ&pf_rd_s=center-6&pf_rd_t=1201' do
      host, pk = ProductSpy.parse('http://www.amazon.de/gp/aw/d/B004O9DF6O/ref=s9_simh_awgw_d1_g200_i0/279-4049004-9468652?aid=aw_gw&apid=317822427&arc=1201&arid=13W5CTR69XS38DGRS4HQ&asn=center-6&pf_rd_i=aw_gw&pf_rd_m=A3JWKAKR8XB7XF&pf_rd_p=317822427&pf_rd_r=13W5CTR69XS38DGRS4HQ&pf_rd_s=center-6&pf_rd_t=1201')
      host.should == 'www.amazon.de'
      pk.should == ['B004O9DF6O']
    end

    it 'parses: http://www.amazon.de/Hauck-662984-Hochstuhl-Alpha-natur/dp/B000K7BELW/ref=sr_1_2?s=baby&ie=UTF8&qid=1360983324&sr=1-2' do
      host, pk = ProductSpy.parse('http://www.amazon.de/Hauck-662984-Hochstuhl-Alpha-natur/dp/B000K7BELW/ref=sr_1_2?s=baby&ie=UTF8&qid=1360983324&sr=1-2')
      host.should == 'www.amazon.de'
      pk.should == ['B000K7BELW']
    end
  end

  context 'build url' do
    it 'returns: https://www.amazon.de/dp/B000K7BELW' do
      ProductSpy.build('www.amazon.de', ['B000K7BELW']).should == 'https://www.amazon.de/dp/B000K7BELW'
    end
    
    it 'returns: https://www.amazon.de/gp/aw/d/B000K7BELW' do
      ProductSpy.build('www.amazon.de', ['B000K7BELW'], :type => 'mobile').should == 'https://www.amazon.de/gp/aw/d/B000K7BELW'
    end
  end
end
