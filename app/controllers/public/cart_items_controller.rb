class Public::CartItemsController < ApplicationController

  before_action :set_cart_item, only: [:update, :destroy]

  def index
    @carts = current_customer.cart_items.all
    @total = @carts.inject(0) {|sum, cart| sum + cart.add_total_payment_all}
  end

  def update
    @cart_item.update(cart_params)
    redirect_to request.referer, notice:' カートを変更しました'
  end

  def destroy
    @cart_item.destroy
    redirect_to request.referer
  end

  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path
  end

  def create
    concert = Concert.find(params[:cart_item][:concert_id])
    quantity = params[:cart_item][:sheet].to_i
    cart_item = current_customer.cart_items.find_by(concert_id: concert.id)
    if cart_item
      cart_item.update(sheet: cart_item.sheet + quantity)
    else
      cart_item = current_customer.cart_items.build(cart_params)
      cart_item.save
    end
    redirect_to cart_items_path, notice:' 商品を追加しました'
  end

  private

  def set_cart_item
    @cart_item = current_customer.cart_items.find(params[:id])
  end

  def cart_params
    params.require(:cart_item).permit(:concert_id, :sheet)
  end

  def increase_or_create(concert_id, sheet)
    cart_item = current_customer.cart_items.find_by(concert_id: concert_id)
    if cart_item
      cart_item.update(sheet: cart_item.sheet + sheet.to_i)
    else
       current_customer.cart_items.new(cart_params).save
    end
  end
end
