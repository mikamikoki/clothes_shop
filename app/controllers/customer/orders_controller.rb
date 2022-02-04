class Customer::OrdersController < ApplicationController

 # before_action :to_log, only: [:show]
 before_action :authenticate_customer!

 def confirm
  @order = Order.new
  @customer = current_customer
  @addresses = Address.where(customer_id: current_customer.id)
 end

 def create
  customer = current_customer

   #sessionを使ってデータを一時保存
  session[:order] = Order.new

  cart_products = current_customer.cart_products

  #billing_amountのための計算
  sum = 0
  cart_products.each do |cart_product|
    sum += (cart_product.product.price * 1.1).floor * cart_product.amount
  end

  session[:order][:shipping_cost] =800
  session[:order][:billing_amount]= sum + session[:order][:shipping_cost]
  session[:order][:order_status] = 0
  session[:order][:customer_id] = current_customer.id
  # ラジオボタンで選択された支払方法のenum番号を渡している
		session[:order][:payment_method] = params[:method].to_i

  #ラジオボタンの支払い方法のenum番号を渡している
  destination = params[:a_method].to_i

  #自分の住所を選択したとき
  if destination == 0
   session[:order][:post_code] = customer.post_code
   session[:order][:address] = customer.address
   session[:order][:name] = customer.last_name + customer.first_name

  elsif destination == 1
   address Address.find(params[:adress_for_order])
   session[:order][:post_code] = address.post_code
   session[:order][:address] = address.address
   session[:order][:name] = address.name

  #新しい届け先が選択されたとき
  elsif destination == 2
   session[:new_address] = 2
   session[:order][:post_code] = params[:post_code]
   session[:order][:address] = params[:address]
   session[:order][:name] = params[:name]

  end

  #届け先の漏れがあった場合リダイレクト
  if session[:order][:post_code].presence && session[:order][:address].presence && session[:order][:name].presence
    redirect_to new_customers_order_path
  else
    redirect_to confirm_customers_orders_path
  end

 end

 def new
  @cart_products = current_customer.cart_products
  # byebug
 end

 def thanx
  order = Order.new(session[:order])
  order.save

  if session[:new_address]
   shipping_address = current_customer.addresses.new
   shipping_address.post_code = order.post_code
   shipping_address.address = order.address
   shipping_address.name = order.name
   shipping_address.save
   session[:new_address] = nil
  end

  #以下order_detail
  cart_products = current_customer.cart_products
  cart_products.each do |cart_product|
    order_detail = OrderDetail.new
    order_detail.order_id = order.id
    order_detail.order_quantity = cart_product.amount
    order_detail.created_status = 0
    order_detail.price = (cart_product.product.price * 1.1).floor
    order_detail.product_id = cart_product.product_id
    order_detail.save
  end

  #購入後はカート内商品削除
  cart_products.destroy_all
 end

 def index
  @orders = current_customer.orders
 end

 def show
  @order = Order.find(params[:id])
  @order_details = @order.order_details
 end





end