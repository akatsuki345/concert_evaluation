class Admin::HomeController < ApplicationController
  before_action :authenticate_admin!

  def top
    # @orders = Order.all
    @order = Order.page(params[:page])
  end
end
