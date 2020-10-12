class ApplicationController < ActionController::Base
    # ログインに関する独自のメソッド（カスタムヘルパー）を使えるようにするためにSessionsHelperを読み込む
    protect_from_forgery with: :exception
    include SessionsHelper
end
