class RestuarantsController < ApplicationController

  def index
    respond_to do |format|
      format.json {render json: Restuarant.all }
    end
  end
end
