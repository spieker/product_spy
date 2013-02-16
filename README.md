[![Build Status](https://travis-ci.org/spieker/product_spy.png)](https://travis-ci.org/spieker/product_spy)

# ProductSpy

ProductSpy is made for parsing product URLs, i.e. Amazon-URLs, to get
the product keys and creating product URLs based on these keys. This can
be used to identify products based on the url or just to clean up
product URLs.

## Installation

Add this line to your application's Gemfile:

    gem 'product_spy'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install product_spy

## Usage

```ruby
# Parsing URLs
ProductSpy.parse('https://www.amazon.de/dp/B004O9DF6O') => ['www.amazon.de', ['B004O9DF6O']]

# Building URLs
ProductSpy.build('amazon.de', ['B004O9DF6O']) # => https://www.amazon.de/dp/B004O9DF6O

# defining patterns
ProductSpy.setup do |config|
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
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
