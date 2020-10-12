class MoviesController < ApplicationController
  before_action :authemnticate?, only: [:new, :create]

  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new()
  end 

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      redirect_to movies_index_path
    else
      render 'new'
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :story, :image)
  end

  def authemnticate?
    if current_user.email != 'msy780022@gmail.com'
      flash[:danger] = '権限がありません'
      redirect_to root_path
    end
  end
end
