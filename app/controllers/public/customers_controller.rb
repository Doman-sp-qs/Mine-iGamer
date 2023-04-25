class Public::CustomersController < ApplicationController
  before_action :ensure_correct_customer, only: [:edit, :update, :destroy]
  
  def show
    @customer = Customer.find(params[:id])
    @posts = @customer.posts
    @new_post = Post.new
  end

  def edit
    @customer = Customer.find(params[:id])
  end
  
  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to customer_path(@customer.id), notice: "ユーザー情報の更新に成功しました"
    else
      render :edit
    end
  end
  
  private
  
  def customer_params
    params.require(:customer).permit(:name, :introduction, :profile_image)
  end
  
  # ユーザ特定用
  def ensure_correct_customer
    if current_customer.id != params[:id].to_i
      flash[:notice] = "権限がありません"
      redirect_to posts_path
    end
  end
  
  
end
