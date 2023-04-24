class Public::PostsController < ApplicationController
  before_action :customer_is_stopping?, only: [:index]
  
  
  def index
    @posts = Post.all.order(created_at: :desc)
    @new_post = Post.new
  end
  
  def create
    @new_post = Post.new(post_params)
    @new_post.customer_id = current_customer.id
    if @new_post.save
      redirect_to post_path(@new_post), notice: "投稿に成功しました"
    else
      @posts = Post.all.order(created_at: :desc)
      render :index
    end
  end

  def show
    @post = Post.find(params[:id])
    # @post_comments = PostComment.all.order(created_at: :desc)
    @customer = Customer.find(@post.customer_id)
    @new_post = Post.new
    @post_comment = PostComment.new
  end

  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post), notice: "投稿の更新に成功しました"
    else
      render :edit
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end
  
  
  private
  
  def post_params
    params.require(:post).permit(:game_name, :title, :body)
  end
  
end
