class UsersController < ApplicationController

#    get '/signup' => 'users#new'
  def new
    user = User.new
  end

#    post '/users' => 'users#create'
  def create
    user = User.new(user_params)

    # store all emails in lowercase to avoid duplicates and case-sensitive login errors:
    user.email.downcase!

    if user.save
      session[:user_id] = user.id
      redirect_to '/'
      flash[:notice] = "Account created successfully!"

    else 
      flash.now.alert = "Oops, couldn't create account. Please make sure you are using a valid email and password and try again."
      redirect_to '/signup'
      
    end
  end   

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end


end
