class Post < ApplicationRecord
  
  # アソシエーション設定
  belongs_to :customer
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  # バリデーション
  validates :game_name, presence: true, length: {maximum: 50}
  validates :title, presence: true, length: {maximum: 20}
  validates :body, presence: true, length: {maximum: 140}
  
  
  # いいね判定
  def favorited_by?(customer)
    favorites.exists?(customer_id: customer.id)
  end
  
  
  # 検索方法分岐
  def self.looks(search, word)
    if search == "perfect_match"
      @post = Post.where("game_name LIKE?","#{word}")
    elsif search == "forward_match"
      @post = Post.where("game_name LIKE?","#{word}%")
    elsif search == "backward_match"
      @post = Post.where("game_name LIKE?","%#{word}")
    elsif search == "partial_match"
      @post = Post.where("game_name LIKE?","%#{word}%")
    else
      @post = Post.all
    end
  end
  
end
