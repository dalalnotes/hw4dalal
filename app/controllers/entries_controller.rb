class EntriesController < ApplicationController
  before_action :authenticate_user

  def create
    @entry = Entry.new
    @entry.title = params[:title]
    @entry.description = params[:description]
    @entry.occurred_on = params[:occurred_on]
    @entry.place_id = params[:place_id]
    @entry.user_id = @current_user.id  # Associate with current user

    if @entry.save
      redirect_to "/places/#{@entry.place_id}", notice: "Entry added!"
    else
      redirect_to "/entries/new", notice: "Failed to create entry."
    end
  end
end