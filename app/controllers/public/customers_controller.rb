class Public::CustomersController < ApplicationController
  before_action :ensure_current_customer
  before_action :ensure_guest_user, only: [:edit]

  def show
    @customer = Customer.find(current_customer.id)
  end

  def edit
    @customer = Customer.find(current_customer.id)
  end

  def update
    @customer = Customer.find(current_customer.id)
    if @customer.update(customer_params)
     flash[:notice] = "変更を保存しました。"
     redirect_to public_customer_path(current_customer.id)
    else
     render :edit
    end
  end

  def unsubscribe
    @customer = Customer.find(current_customer.id)
  end

  def withdraw
    @customer = Customer.find(current_customer.id)
    @customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  private
    def customer_params
      params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :nickname, :email, :postal_code, :address, :telephone_number)
    end

    def ensure_current_customer
     if !customer_signed_in?
       #ログイン/未ログインの処理 未ログインならトップへ
      redirect_to root_path
     end
    end

    def ensure_guest_user
     @customer = Customer.find(params[:id])
     if @customer.email == "guest@example.com"
       redirect_to public_customer_path(current_customer) , notice: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
     end
    end

end
