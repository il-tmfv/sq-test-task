require 'singleton'

class ConfigProvider
  include Singleton
  FILE_NAME = 'config/market_config.yml'

  def initialize
    @logger = Logger.new 'log/config_provider.log'
    read_file FILE_NAME
  end

  def for(key)
    (@config.key? key) ? @config[key] : {}
  end

  def players_quota
    (@config['market'] && @config['market']['players_quota']) ? @config['market']['players_quota'] : 1
  end

  def products
    @config['products'] ? @config['products'] : {}
  end

  def product(key)
    (@config['products'] && @config['products'][key]) ? @config['products'][key] : {}
  end

  def capacity
    (@config['storage'] && @config['storage']['capacity']) ? @config['storage']['capacity'] : 1
  end

  protected

  def read_file(file_name)
    begin
      @config = YAML::load_file file_name
      @logger.warn("Got config from file - #{@config}")
    rescue Errno::ENOENT => ex
      @logger.error("Caught error #{ex} while reading file")
    rescue StandardError => ex
      @logger.error("Caught unknown error #{ex} while reading file")
    end
  end
end