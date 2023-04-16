class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @total = @order_details.inject(0) {|sum, order_detail| sum + order_detail.add_total_payment_all}
  end

  def update
      @order = Order.find(params[:id])
      @order.update(order_params)
   if @order.status == "payment_confirmation"
      @order_detail = @order.order_details
      @order_detail.update_all(making_status:'tyakusyumati')
   end
      redirect_back(fallback_location: admin_order_path)
  end

  private

  def order_params
    params.require(:order).permit(:status, :order_detail)
  end
end
