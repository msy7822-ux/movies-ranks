class VotesController < ApplicationController
  # 投票するためにはログインが必須
  before_action :login?

  def new
    @movies = Movie.all
  end

  def create
    @vote = Vote.new(user_id: params[:vote][:user_id], movie_id: params[:vote][:movie_id], comment: params[:vote][:comment])
    if @vote.save
      flash[:success] = "投票が完了しました"
      redirect_to movies_path
    else
      render 'new'
    end
  end

  # strongparametersは使わない
  # private
  # def vote_params
  #   params.require(:vote).permit(:user_id, :movie_id)
  # end
end
