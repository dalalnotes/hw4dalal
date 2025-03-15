class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new
    @user.first_name = params[:username]
    @user.email = params[:email]
    @user.password = params[:password]
    
    if @user.save
      session[:user_id] = @user.id
      redirect_to "/places", notice: "Account created!"
    else
      redirect_to "/users/new", notice: "Sign-up failed."
    end
  end
end
