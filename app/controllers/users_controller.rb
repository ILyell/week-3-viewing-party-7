class UsersController < ApplicationController 
  def new 
    @user = User.new()
  end 

  def show 
    if session[:user_id] == nil
      flash[:error] = "You must be logged in to access your dashboard."
      redirect_to root_path
    else
      @user = User.find(session[:user_id])
    end
  end 

  def create 
    user = User.create(user_params)
    if user.save 
      redirect_to user_path(user)
    else  
      flash[:error] = user.errors.full_messages.to_sentence
      redirect_to register_path
    end 
  end 

  def login_form

  end
  
  def create_viewing_party
    if session[:user_id] == nil
      flash[:error] = "You must be logged in to create a viewing party"
      redirect_to movie_path(session[:movie_id])
    else
      redirect_to root_path
    end
  end

  def login
    user = User.find_by(email: params[:email])
    if user.authenticate(params[:password])
      flash[:success] = "Welcome, #{user.name}"
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash[:error] = "Bad Credentials"
      render :login_form
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to root_path
  end

  private 

  def user_params 
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end 
end 