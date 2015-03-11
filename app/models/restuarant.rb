class Restuarant

  def self.all
    response = DataFetch::Main.get_restaurents
    restuarants = response["businesses"]
    filtered_restuarants_info = []
    restuarants.each do |restuarant|
      filtered_restuarants_info << { "restaurant_name" => restuarant["name"],
                                     "review_count" => restuarant["review_count"],
                                     "address" => get_restuarant_address(restuarant),
                                     "rating" => restuarant["avg_rating"]
                                   }
    end
    filtered_restuarants_info
  end

  def self.get_restuarant_address restuarant
    restuarant.select { |key, value| key == "city" || key == "state" ||
                                     key == "latitude" || key == "longitude"
                      }.merge( { "zipcode" => restuarant["zip"] } )
  end

end
