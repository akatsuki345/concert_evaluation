# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  before_action :customer_state, only: [:create]

  def guest_sign_in
    customer = Customer.guest
    sign_in customer
    redirect_to public_customer_path(customer), notice: 'guestuserでログインしました。'
  end

  def after_sign_in_path_for(resource)
   root_path
  end

  def after_sign_out_path_for(resource)
   new_customer_session_path
  end

  private

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :email, :postal_code, :address, :telphone_number, :is_deleted)
  end
  protected
# 退会しているかを判断するメソッド
  def customer_state
    ## 【処理内容1】 入力されたemailからアカウントを1件取得
    @customer = Customer.find_by(email: params[:customer][:email])
    ## アカウントを取得できなかった場合、このメソッドを終了する
    return if !@customer
    ## 【処理内容2】 取得したアカウントのパスワードと入力されたパスワードが一致してるかを判別
    if @customer.valid_password?(params[:customer][:password])&& (@customer.is_deleted == true)
      ## 【処理内容3】退会済みの処理　新規登録画面へ
      flash[:notice] = "退会済みです。再度ご登録をしてご利用ください。"
       redirect_to new_customer_registration_path
    end
  end

end
