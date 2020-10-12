class SessionsController < ApplicationController

    def new
    end 

    def create
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            login(user)
            flash[:success] = "ログインしました"
            redirect_to user_url(user)
        else
            flash.now[:danger] = 'パスワードまたはメールアドレスが誤っています。'
            render 'new'
        end
    end

    def destroy
        logout
        flash[:success] = "ログアウトしました"
        redirect_to root_url
    end
end
