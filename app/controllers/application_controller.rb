class ApplicationController < ActionController::Base
    # ログインに関する独自のメソッド（カスタムヘルパー）を使えるようにするためにSessionsHelperを読み込む
    protect_from_forgery with: :exception
    include SessionsHelper
    include UsersHelper
    include MoviesHelper

    private 

    # ユーザーがログインしているかどうか
    def login?
        if current_user == nil
        flash[:danger] = 'ログインしてください'
        redirect_to login_url
        end
    end

end
