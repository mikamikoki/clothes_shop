class Customer::AddressesController < ApplicationController

before_action :authenticate_customer!

  def index
  	@addresses = current_customer.addresses.page(params[:page]).per(3)
    # @addresses = Address.all
  	@address = Address.new
  end

  def create
  	@address = Address.new(address_params)
  	@address.customer_id = current_customer.id
  	@address.save
  	redirect_to customers_addresses_path
  end

  def edit
  	@address = Address.find(params[:id])
  end

  def update
  	@address = Address.find(params[:id])
  	@address.update(address_params)
  	redirect_to customers_addresses_path
  end

  def destroy
  	@address = Address.find(params[:id])
  	@address.destroy
  	redirect_to customers_addresses_path
  end

  private
  def address_params
  	params.require(:address).permit(:name, :customer_id, :address, :post_code)
  end

end