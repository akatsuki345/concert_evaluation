class Admin::OrdersController < ApplicationController
  # def show
  #   @order = Order.find(params[:id])
  # if @order.nil?
  #   flash[:alert] = "注文はありません。"
  #   redirect_to admin_orders_path
  # else
  #   @order_details = @order.order_details
  #   @total = @order_details.inject(0) {|sum, order_detail| sum + order_detail.add_total_payment_all}
  # end
  # end

  def show
    begin
      @order = Order.find(params[:id])
      @order_details = @order.order_details
      @total = @order_details.inject(0) {|sum, order_detail| sum + order_detail.add_total_payment_all}
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = "注文はありません。"
      redirect_to admin_root_path
    end
  end

  def update
      @order = Order.find(params[:id])
      @order.update(order_params)
   if @order.status == "payment_confirmation"
      @order_detail = @order.order_details
      @order_detail.update_all(shipping_status:1)
   end
      redirect_back(fallback_location: admin_order_path)
  end

  private

  def order_params
    params.require(:order).permit(:status, :order_detail)
  end
end
