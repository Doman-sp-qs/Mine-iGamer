class Admin::PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
    @customer = Customer.find(@post.customer_id)
    @new_post = Post.new
    @post_comment = PostComment.new
  end

  def edit
    @post = Post.find(params[:id])
  end
end
