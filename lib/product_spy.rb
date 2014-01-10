require 'singleton'
require 'addressable/uri'
require 'product_spy/version'
require 'product_spy/configuration'
require 'product_spy/host'

module ProductSpy
  setup do |config|
    config.host 'www.amazon.de', :aliases => ['amazon.de'] do |host|
      # ** Mobile
      # http://www.amazon.de/gp/aw/d/B004O9DF7I/ref=aw_d_var_2nd_sports_img?vs=1
      # http://www.amazon.de/gp/aw/B000K7BELW/ref=aw_imgblk_0?h=356&ie=UTF8&selIdx=0&tag=viddleit-21&w=320
      host.parse /^http[s]{0,1}:\/\/(www\.|)amazon\.de\/gp\/aw(\/d|)\/([A-Z0-9]{10})(\/.*|)$/, [3]

      # ** Desktop
      # http://www.amazon.de/Hauck-662984-Hochstuhl-Alpha-natur/dp/B000K7BELW/ref=sr_1_2?s=baby&ie=UTF8&qid=1360979509&sr=1-2
      # http://www.amazon.de/dp/B000K7BELW/
      host.parse /^http[s]{0,1}:\/\/(www\.|)amazon\.de(\/.*?|)\/dp\/([A-Z0-9]{10})(\/.*|)$/, [3]

      host.build :default, 'https://www.amazon.de/dp/:1'
      host.build :mobile, 'https://www.amazon.de/gp/aw/d/:1'
    end

    config.host 'www.baby-markt.de', :aliases => ['baby-markt.de'] do |host|
      # http://www.baby-markt.de/Markenhersteller/Reer/Heizstrahler/REER-1909-Wickeltisch-Heizstrahler-mit-Standfuss.html
      host.parse /^http[s]{0,1}:\/\/(www.|)baby-markt\.de(\/.*?)(\?.*|)$/, [2]

      host.build :default, 'https://www.baby-markt.de:1'
    end

    config.host 'www.ebay.de', :aliases => ['ebay.de'] do |host|
      # http://www.ebay.de/itm/(390542152250)
      # http://www.ebay.de/itm/Inspirierende-Ferienhauser-/(390542152250)?pt=Sach_Fachb%C3%BCcher&hash=item5aee20523a#ht_500wt_948
      host.parse /^http[s]{0,1}:\/\/(www.|)ebay\.de\/itm(\/.+?|)\/(\d+)/, [3]
      host.build :default, 'http://www.ebay.de/itm/:1'
    end

    config.host 'www.arzberg-shop.de', :aliases => ['arzberg-shop.de'] do |host|
      # http://www.arzberg-shop.de/product_info.php/(info/p9845_Kuchenplatte-eckig-35-cm------1382--Weiss.html)
      host.parse /^http[s]{0,1}:\/\/(www.|)arzberg-shop\.de\/product_info\.php\/(.*?)(\?.*|)$/, [2]
      host.build :default, 'http://www.arzberg-shop.de/product_info.php/:1'
    end

    config.host 'www.lecreuset.de', :aliases => ['lecreuset.de'] do |host|
      # http://www.lecreuset.de/Produkte-/(Gusseisen/Klassische-Brater/Brater-Tradition-rund-24cm)/
      host.parse /^http[s]{0,1}:\/\/(www.|)lecreuset\.de\/Produkte-\/(.+?)(\/|)(\?.*|)$/, [2]
      host.build :default, 'http://www.lecreuset.de/Produkte-/:1/'
    end

    config.host 'www.porzellanhandel24.de', :aliases => ['porzellanhandel24.de'] do |host|
      # http://www.porzellanhandel24.de/(villeroy-boch-royal-becher-mit-henkel)/?refID=froogle&gclid=CL7Z-K63zrQCFXHLtAodTVoA5w
      host.parse /^http[s]{0,1}:\/\/(www.|)porzellanhandel24\.de\/(.+?)(\/|)(\?.*|)$/, [2]
      host.build :default, 'https://www.porzellanhandel24.de/:1'
    end

    config.host 'www.hornbach.de', :aliases => ['hornbach.de'] do |host|
      # http://www.hornbach.de/shop/(HORNBACH-Projektbuch)/(7395450)/artikel.html?sourceCat=S1405&WT.svl=artikel_text
      host.parse /^http[s]{0,1}:\/\/(www.|)hornbach\.de\/shop\/(.+?)\/(\d+?)\/artikel\.html(\?.*|)$/, [2,3]
      host.build :default, 'https://www.hornbach.de/shop/:1/:2/artikel.html'
    end

    config.host 'www.baby-walz.de', :aliases => ['baby-walz.de'] do |host|
      # http://www.baby-walz.de/(Rassel-Soeckchen-321588).html?group=3020165&pgpkl=cad489c2d189d388b31a2206fd609664
      host.parse /^http[s]{0,1}:\/\/(www.|)baby-walz\.de\/(.+?)\.html(\?.*|)$/, [2]
      host.build :default, 'https://www.baby-walz.de/:1.html'
    end
  end

  # Build the url for a given host and primary key
  #
  # Example
  # =======
  #
  #     ProductSpy.build('amazon.de', ['B004O9DF6O']) # => https://www.amazon.de/dp/B004O9DF6O
  #
  def self.build(host, pk, options = {})
    options = {
      :type => :default
    }.merge(options)

    host = Configuration.instance.hosts[host.to_sym]
    host.make_url(pk, options)
  end

  # Get the primary key of a given url
  #
  # Example
  # =======
  #
  #     ProductSpy.parse('https://www.amazon.de/dp/B004O9DF6O') => ['www.amazon.de', ['B004O9DF6O']]
  #
  def self.parse(url)
    uri = Addressable::URI.parse(url)
    host = Configuration.instance.hosts[uri.host.downcase.to_sym] unless uri.nil? or uri.host.nil?
    return nil if host.nil?
    return nil if (pk = host.make_pk(url)).nil?
    [host.host_name.downcase, pk]
  end
end
