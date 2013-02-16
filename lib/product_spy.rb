require 'singleton'
require 'addressable/uri'
require 'product_spy/version'
require 'product_spy/configuration'
require 'product_spy/host'

module ProductSpy
  setup do |config|
    config.host 'amazon.de', 'www.amazon.de' do |host|
      # ** Mobile
      # http://www.amazon.de/gp/aw/d/B004O9DF7I/ref=aw_d_var_2nd_sports_img?vs=1
      # http://www.amazon.de/gp/aw/B000K7BELW/ref=aw_imgblk_0?h=356&ie=UTF8&selIdx=0&tag=viddleit-21&w=320
      host.parse /^http[s]{0,1}:\/\/(www\.|)amazon.de\/gp\/aw(\/d|)\/([A-Z0-9]{10})(\/.*|)$/, [3]

      # ** Desktop
      # http://www.amazon.de/Hauck-662984-Hochstuhl-Alpha-natur/dp/B000K7BELW/ref=sr_1_2?s=baby&ie=UTF8&qid=1360979509&sr=1-2
      # http://www.amazon.de/dp/B000K7BELW/
      host.parse /^http[s]{0,1}:\/\/(www\.|)amazon.de(\/.*?|)\/dp\/([A-Z0-9]{10})(\/.*|)$/, [3]

      host.build :default, 'https://www.amazon.de/dp/:1'
      host.build :mobile, 'https://www.amazon.de/gp/aw/d/:1'
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
    host = Configuration.instance.hosts[uri.host.downcase.to_sym]
    return nil if host.nil?
    [host.host_name.downcase, host.make_pk(url)]
  end
end
