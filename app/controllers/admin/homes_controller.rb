class Admin::HomesController < ApplicationController
  
  def customers
    @customers = Customer.all
  end
  
  def posts
    @posts = Post.all
  end
  
end
