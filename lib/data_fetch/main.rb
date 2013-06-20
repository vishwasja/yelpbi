require 'rest_client'


module DataFetch
  module Main
    def self.get_restaurents
      begin
        res = RestClient.get("http://api.yelp.com/business_review_search?term=indian%20restaurant&location=94087&ywsid=Xp6cQjvhIyOEVCm5WK0Ghw")
        res = ActiveSupport::JSON.decode(res)
        return res
      rescue Exception => e
        Rails.logger.info 'Bad Request' + e.message
        return
      end
    end
  end
end