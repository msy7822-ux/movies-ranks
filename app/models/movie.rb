class Movie < ApplicationRecord
    has_many :votes
    has_many :users, through: :votes

    # 画像アップロード
    mount_uploader :image, ImageUploader
    # バリデーション
    validates :title, presence: true
    validates :story, presence: true
end
