# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  before_action :customer_state, only: [:create]
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected
  # 退会しているかを判断するメソッド
  def customer_state
    # 【処理１】入力されたemailからアカウントを１件取得
    @customer = Customer.find_by(email: params[:customer][:email])
    # アカウントを取得できなかった場合、このメソッドを修了する
    return if !@customer
    # 【処理２】取得したアカウントのパスワードと入力されたパスワードが一致しかつ退会済みかを判別
    if @customer.valid_password?(params[:customer][:password]) && @customer.is_deleted
      # 【処理３】退会済みの場合、サインアップページへリダイレクトする
      redirect_to new_customer_registration_path
    end
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
