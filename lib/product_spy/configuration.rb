module ProductSpy
  class Configuration
    include Singleton

    attr_reader :hosts

    def initialize
      @hosts = {}
    end

    def host(host, options = {}, &block)
      host_inst = Host.new(host)
      yield host_inst
      @hosts[host.to_sym] = host_inst

      options = {
        :aliases => []
      }.merge(options)

      options[:aliases].each do |host|
        @hosts[host.to_sym] = host_inst
      end
    end
  end
  def self.setup(&block)
    yield Configuration.instance
  end
end
