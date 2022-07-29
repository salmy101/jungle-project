class UsersController < ApplicationController

#    get '/signup' => 'users#new'
  def new
  end

#    post '/users' => 'users#create'
  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/'
      flash[:notice] = "Account created successfully!"

    else 
      redirect_to '/signup'
      
    end
  end   

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end


end
