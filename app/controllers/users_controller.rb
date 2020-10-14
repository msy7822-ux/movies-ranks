class UsersController < ApplicationController
  before_action :login?, only: [:edit, :update, :destroy]
  before_action :right_user?,  only: [:edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @votes = Vote.where(id: @user.votes)

    # ユーザーが投票ないしは、コメントした映画情報を格納する配列
    @movies = movies(@votes)
  end

  def new
    # 新規ユーザーの作成のためのからのオブジェクトの作成
    @user = User.new()
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = '新規登録が完了しました'
      login(@user)
      redirect_to user_url(@user)
    else
      # @user = User.new(user_params) #newで入力した値を代入
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      flash[:success] = '登録情報を更新しました'
      redirect_to user_url(@user)
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      logout
      flash[:success] = 'アカウントを削除しました'
      redirect_to root_path
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end


  def right_user?
    @user = User.find(params[:id])
    if @user != current_user
      flash[:danger] = '権限がありません'
      redirect_to root_path
    end
  end

end
