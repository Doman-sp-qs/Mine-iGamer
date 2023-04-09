class Public::PostsController < ApplicationController
  def index
    @posts = Post.all
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    @post.customer_id = current_customer.id
    if @post.save
      redirect_to post_path(@post), notice: "You have created book successfully."
    else
      @posts = Post.all
      render :index
    end
  end

  def show
    @post = Post.find(params[:id])
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
      redirect_to post_path(@post), notice: "You have updated book successfully."
    else
      render :edit
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end
  
  def post_params
    params.require(:post).permit(:game_name, :title, :body)
  end
  
end
