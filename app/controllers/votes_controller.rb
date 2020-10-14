class VotesController < ApplicationController
  # 投票するためにはログインが必須
  before_action :login?

  def new
    @movies = Movie.all
  end

  def create
    if params[:vote][:movie_id] != ""
      # 投票された映画のテーブル（movieテーブル）の投票数のカラム（pointsカラム）に「 +1 」をする
      @movie = Movie.find(params[:vote][:movie_id])
      if @movie.points.nil?
        @movie.points = 1
      else
        @movie.points += 1
      end
      # 投票数の更新処理
      @movie.update(points: @movie.points)

      @vote = Vote.new(user_id: params[:vote][:user_id], movie_id: params[:vote][:movie_id], comment: params[:vote][:comment])
      if @vote.save
        flash[:success] = "投票が完了しました"
        redirect_to movies_path
      else
        render 'new'
      end
    else
      flash[:danger] = "映画を選択してください"
      redirect_to new_vote_path
    end
  end

  # strongparametersは使わない
  # private
  # def vote_params
  #   params.require(:vote).permit(:user_id, :movie_id)
  # end
end
