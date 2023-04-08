class Public::PostsController < ApplicationController
  def index
    @posts = Post.all
    @post = Post.new
  end

  def show
  end

  def edit
  end
  
  
  def post_params
    params.require(:book).permit(:game_name, :title, :body)
  end
  
end
