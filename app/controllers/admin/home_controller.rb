class Admin::HomeController < ApplicationController
  before_action :authenticate_admin!

  def top
    @orders = Order.all
    if @orders.empty?
      flash[:alert] = "注文はありません。"
    end
    @order = Order.page(params[:page])
  end
end
