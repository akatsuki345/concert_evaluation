class Public::AddressController < ApplicationController

  before_action :ensure_current_customer
  def index
    @address = Address.new
    @customer = Customer.find(current_customer.id)
    @addresses = @customer.addresses
  end

  def new
    @address = Address.new
  end

  def edit
    @address = Address.find(params[:id])
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
      flash[:notice] = "登録に成功しました。"
      redirect_to addresses_path
    else
      @customer = Customer.find(current_customer.id)
      @addresses = @customer.addresses
      render :index
    end
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      flash[:notice] = "変更を保存しました"
      redirect_to addresses_path
    else
      @customer = Customer.find(current_customer.id)
      @addresses = @customer.addresses
      render :edit
    end
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to addresses_path
  end

  private

  def address_params
    params.require(:address).permit(:postal_code, :address, :name)
  end

  def ensure_current_customer
    if !customer_signed_in?
      redirect_to root_path
    end
  end

end
