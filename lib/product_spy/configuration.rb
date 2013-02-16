module ProductSpy
  class Configuration
    include Singleton

    attr_reader :hosts

    def initialize
      @hosts = {}
    end

    def host(*hosts, &block)
      hosts.each do |host|
        host_inst = Host.new(host)
        yield host_inst
        @hosts[host.to_sym] = host_inst
      end
    end
  end
  def self.setup(&block)
    yield Configuration.instance
  end
end
