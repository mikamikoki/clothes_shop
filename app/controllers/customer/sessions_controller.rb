# frozen_string_literal: true

class Customer::SessionsController < Devise::SessionsController
  
     before_action :reject_customer, only: [:create]
  
  protected

  def reject_customer
    @customer = Customer.find_by(email: params[:customer][:email].downcase)
    ##downcaseは文字列に含まれている大文字を小文字に変換するメゾット
    if @customer
      if (@customer.valid_password?(params[:customer][:password]) && (@customer.active_for_authentication? == false))
        flash[:alert] = "このアカウントは退会済みです。"
        redirect_to new_customer_session_path
      end
    else
    end
  end
  #9～19行まではチャンズのパクリ
  
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

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
