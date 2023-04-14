class Admin::PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
    @customer = Customer.find(@post.customer_id)
    @post_comment = PostComment.new
  end

  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to admin_post_path(@post), notice: "投稿の更新に成功しました"
    else
      render :edit
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to admin_posts_path
  end
  
  
  private
  
  def post_params
    params.require(:post).permit(:game_name, :title, :body)
  end
  
end
