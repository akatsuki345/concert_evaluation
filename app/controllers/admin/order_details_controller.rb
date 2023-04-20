class Admin::OrderDetailsController < ApplicationController
  def update
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
    @order_details = @order.order_details.all

    @order_detail.update(shipping_status: order_details_params)
    if @order_details.where(shipping_status: 2).count >= 1
      @order.status = 2
      @order.save
    end

    if @order_details.where(shipping_status: 3).count == @order_details.count
      @order.status = 3
      @order.save
    end
    redirect_to admin_order_path(@order)
  end

  private
   def order_details_params
    OrderDetail.making_statuses[params[:order_detail][:shipping_status]]
   end
end
