class Admin::OrdersController < ApplicationController

  before_action :authenticate_admin!

  def index
    @orders = Order.all.page(params[:page]).per(10)
  end

  # def current_index
  #   @orders = Order.where(customer_id: params[:id]).page(params[:page]).per(10)
  #   render :index
  # end

  # def today_order_index
  #   now = Time.current
  #   @orders = Order.where(created_at: now.all_day).page(params[:page]).per(10)
  #   render :index
  # end

	def show
		@order = Order.find(params[:id])
		@order_details = @order.order_details
	end

	def update
		@order = Order.find(params[:id])
		@order_details = @order.order_details
		if @order.update(order_params)
		   flash[:success] = "注文ステータスを変更しました"

		   if @order.order_status == "入金確認"#注文ステータスが入金確認なら下の事をする
		       @order_details.update_all(created_status: 1) #製作ステータスを「製作待ちに」　更新
		   redirect_to admin_order_path(@order)
		   end
		else
		   render "show"
		end
	end

	private
	def order_params
		  params.require(:order).permit(:order_status)
	end
end
