require 'logger'

module Myxy
  module Log
    def self.logger
      Logger.new('./tmp/errors.log', 'daily')
    end

    def self.info(msg)
      logger.info(msg)
    end

    def self.error(msg)
      logger.error(msg)
    end
  end
end
