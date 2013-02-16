module ProductSpy
  class Host
    class Parser
      def initialize(regexp, pk_keys)
        @regexp = regexp
        @pk_keys = pk_keys
      end

      def get_pk(url)
        if m = @regexp.match(url)
          return @pk_keys.map do |i|
            m[i]
          end
        else
          return nil
        end
      end
    end

    class Builder
      def initialize(pattern)
        @pattern = pattern
      end

      def get_url(pk)
        @pattern.gsub /:(\d+)/ do |i|
          pk[i[1..-1].to_i-1]
        end
      end
    end

    attr_reader :host_name

    def initialize(host_name)
      @host_name = host_name
      @parser = []
      @builder = {}
    end

    def parse(regex, pk_keys)
      @parser << Parser.new(regex, pk_keys)
    end

    def build(type, pattern)
      @builder[type.to_sym] = Builder.new(pattern)
    end

    def make_url(pk, options)
      builder = @builder[options[:type].to_sym]
      builder.get_url(pk)
    end

    def make_pk(url)
      @parser.each do |parser|
        result = parser.get_pk(url)
        return result unless result.nil?
      end
      return nil
    end
  end
end

