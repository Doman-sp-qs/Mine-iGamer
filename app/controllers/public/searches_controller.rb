class Public::SearchesController < ApplicationController
  
  before_action :authenticate_customer!
  
  def search
    # 検索項目の定義
    @range = params[:range]
    if @range == "ユーザ名"
      # 検索項目がユーザ名の時のデータ取得
      @customers = Customer.looks(params[:search], params[:word])
    else
      # 検索項目がCustomer以外の時のデータ取得
      @posts = Post.looks(params[:search], params[:word])
    end  
  end
  
end
