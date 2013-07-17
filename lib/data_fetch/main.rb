require 'rest_client'
require 'socket'



module DataFetch
  module Main
    def self.get_restaurents
      begin
        res = File.read("#{Rails.root}/public/restaurants.json")
        res = ActiveSupport::JSON.decode(res)
        return res
      rescue Exception => e
        Rails.logger.info 'Bad Request' + e.message
        return
      end
    end
  end
end