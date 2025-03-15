class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to "/places", notice: "Logged in successfully!"
    else
      redirect_to "/login", notice: "Invalid email or password."
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to "/login", notice: "Logged out successfully!"
  end
end
