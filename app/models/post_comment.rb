class PostComment < ApplicationRecord
  
  # アソシエーション設定
  belongs_to :customer
  belongs_to :post
  
  # バリデーション
  validates :post_comment, presence: true, length: {maximum: 140}
  
end
