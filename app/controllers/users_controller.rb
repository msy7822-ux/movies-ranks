class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    # 新規ユーザーの作成のためのからのオブジェクトの作成
    @user = User.new()
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = '新規登録が完了しました'
      redirect_to root_path
    else
      # @user = User.new(user_params) #newで入力した値を代入
      render 'new'
    end
  end

  def destroy
  end


  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
