class ApplicationController < ActionController::Base
  before_action :current_user
  
  def current_user
    @current_user = User.find_by(id: session[:user_id])
  end

  def authenticate_user
    if @current_user.nil?
      redirect_to "/login", notice: "Please log in first."
    end
  end
end