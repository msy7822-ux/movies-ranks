class MoviesController < ApplicationController
  before_action :authemnticate?, only: [:new, :create, :destroy]

  def index
    @movies = Movie.all.page(params[:page]).per(6).order(points: "desc", created_at: "desc")
  end

  def show
    @movie = Movie.find(params[:id])
    @votes = Vote.where(movie_id: @movie.id)
    @all_vote_num = Vote.all.count
  end

  def new
    @movie = Movie.new()
  end 

  def create
    @movie = Movie.new(movie_params)
    @movie.points = 0

    if @movie.save
      redirect_to movies_path
    else
      render 'new'
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    if @movie.destroy
      flash[:success] = '映画情報を削除しました'
      redirect_to movies_path
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
