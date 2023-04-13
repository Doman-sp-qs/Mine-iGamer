class ApplicationController < ActionController::Base
  before_action :authenticate_customer!, except: [:top, :about]
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.is_a?(Admin)
      # 管理者のトップページ(顧客一覧)
      admin_customers_path
    else
      # トップページ
      root_path
    end
  end
  
  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :user
      # トップページ
      root_path
    elsif resource_or_scope == :admin
      # 管理者ログインページ
      new_admin_session_path
    else
      root_path
    end
  end
  
  protected
  
  def customer_is_stopping?
    if current_customer.is_stopping
      redirect_to new_customer_session_path, notice: "このアカウントは利用停止中です"
    end
  end
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
  
end
