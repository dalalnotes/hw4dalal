class PlacesController < ApplicationController
  def index
    if @current_user
      @places = Place.where(user_id: @current_user.id) # Show only the logged-in user's places
    else
      @places = Place.all # Show all places if not logged in
    end
  end

  def show
    @place = Place.find_by(id: params[:id])

    if @place.nil?
      redirect_to places_path, alert: "Place not found."
    else
      @entries = @place.entries.all || [] # Ensure @entries is an array even if no entries exist
    end
  end

  def new
    if @current_user
      @place = Place.new
    else
      redirect_to "/login", alert: "You must be logged in to create a place."
    end
  end

  def create
    if @current_user
      @place = Place.new(name: params[:name], user_id: @current_user.id)
      if @place.save
        redirect_to places_path, notice: "Place created successfully."
      else
        render :new
      end
    else
      redirect_to "/login", alert: "You must be logged in to create a place."
    end
  end
end
