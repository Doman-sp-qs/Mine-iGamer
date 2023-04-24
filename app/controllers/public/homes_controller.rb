class Public::HomesController < ApplicationController
  before_action :customer_is_stopping?, only: [:top, :about]
  
  def top
    @new_post = Post.new
  end

  def about
    @new_post = Post.new
  end
end
