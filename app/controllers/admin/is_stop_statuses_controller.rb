class Admin::IsStopStatusesController < ApplicationController
  
  def create
    @customer = Customer.find(params[:id])
    @customer.update(is_stopping: true)
    flash[:notice] = "このアカウントを停止しました"
    redirect_to admin_customer_path(@customer.id)
  end
  
  def destroy
    @customer = Customer.find(params[:id])
    @customer.update(is_stopping: false)
    flash[:notice] = "このアカウントを利用可能にしました"
    redirect_to admin_customer_path(@customer.id)
  end
  
  
end
