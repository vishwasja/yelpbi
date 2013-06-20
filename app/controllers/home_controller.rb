class HomeController < ApplicationController
  def index
  end
  
  def call_data
    data = DataFetch::Main.get_restaurents
    data = data["businesses"].sort_by{|x| x['review_count'].to_i}.reverse!
    arr = []
    data[0..9].each do |x|
      x.keep_if{|key, val| key == "name" || key == "review_count"}
      arr << x
    end
    p data
    puts "****************"
    p arr
    respond_to do |format|
      format.json {render json: arr }
    end
  end
end
