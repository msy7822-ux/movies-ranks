class Movie < ApplicationRecord
    # 画像アップロード
    mount_uploader :image, ImageUploader
    # バリデーション
    validates :title, presence: true
    validates :story, presence: true
end
