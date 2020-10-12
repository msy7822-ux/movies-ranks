module SessionsHelper

    # 引数に渡したユーザーでログインする（セッションを保つ）(※あくまでセッションに値を渡すだけ)
    def login(user)
        session[:user_id] = user.id
    end

    # 現在セッションに渡されているログインユーザーを返す
    def current_user
        if session[:user_id]
            return User.find_by(id: session[:user_id])
        end
    end

    # ログアウトする（セッションに保持させた値を削除する）
    def logout
        session.delete(:user_id)
    end
end
