class MoviesController < ApplicationController
  def index 
      # @user = User.find(params[:id])
      @movies = Movie.all
  end 

  def show 
      # @user = User.find(params[:user_id])
      @movie = Movie.find(params[:id])
      session[:movie_id] = @movie.id
  end 
end 