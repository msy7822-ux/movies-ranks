class User < ApplicationRecord
    validates :name, presence:true, length: { maximum: 51 }
    # メールアドレスの有効性に関する正規表現
    VALID_EMAIL_REGEX = /\A[\W+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence:true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
end
