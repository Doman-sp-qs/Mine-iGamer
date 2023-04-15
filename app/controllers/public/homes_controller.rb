class Public::HomesController < ApplicationController
  before_action :customer_is_stopping?, only: [:top, :about]
  
  def top
  end

  def about
  end
end
