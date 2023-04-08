class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @addresses = current_customer.addresses
    @address = Address.new
  end

  def comfirm
    @carts = current_customer.cart_items
    @total = @carts.inject(0) {|sum, cart| sum + cart.add_total_payment_all}
    @order = current_customer.orders.new(order_params)
    #送料の定義
    @order.total_payment = @total
    select_destination(params[:order][:option])
    @order.status = 0

    unless @order.valid?
      flash.now[:alert] = "注文情報の入力に誤りがあります。もう一度確認してください。"
      render :new
    end
  end

  def complete
  end

  def create
    order = current_customer.orders.new(order_params)
    order.status = 0
    order.save
    current_customer.cart_items.each do |cart_item|
      order_detail = OrderDetail.new(
        order_id: order.id,
        concert_id: cart_item.concert_id,
        price: cart_item.concert.price,
        sheet: cart_item.sheet,
        making_status: 0
      )
      order_detail.save!
      cart_item.destroy
    end
    # current_customer.cart_items.destroy_all
    redirect_to complete_path
  end

  def index
    @orders = current_customer.orders
    @carts = current_customer.cart_items
  end

  def show
    @order = current_customer.orders.find(params[:id])
    @order_details = @order.order_details
    @total = @order_details.inject(0) {|sum, order_detail| sum + order_detail.add_total_payment_all}
  end

  private
    def order_params
      params.require(:order).permit(
        :postal_code,
        :address,
        :name,
        # 請求額
        :total_payment,
        # 支払い方法
        :payment_method,
        )
    end
    def select_destination(option)
      case option
        when '0'
          @order.postal_code = current_customer.postal_code
          @order.address = current_customer.address
          @order.name = current_customer.add_full_name
        when '1'
          del = Address.find(params[:order][:address_id])
          @order.postal_code = del.postal_code
          @order.address = del.address
          @order.name = del.name
        when '2'
          @order.postal_code = params[:order][:other_postal_code]
          @order.address = params[:order][:other_address]
          @order.name = params[:order][:other_name]
      end
    end

end
