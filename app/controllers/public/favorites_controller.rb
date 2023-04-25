class Public::FavoritesController < ApplicationController
  
  def index
    # ログイン中のアカウントがいいねした投稿のidを取得
    @favorites = Favorite.where(customer_id: current_customer.id).pluck(:post_id)
    # ログイン中のアカウントがいいねした投稿内容を取得
    @favorite_posts = Post.find(@favorites)
    # 新規投稿作成
    @new_post = Post.new
  end
  
  def create
    @post = Post.find(params[:post_id])
    favorite = current_customer.favorites.new(post_id: @post.id)
    favorite.save
  end
  
  def destroy
    @post = Post.find(params[:post_id])
    favorite = current_customer.favorites.find_by(post_id: @post.id)
    favorite.destroy
  end
  
end
