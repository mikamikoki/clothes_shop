class Admin::OrderDetailsController < ApplicationController

  before_action :authenticate_admin!

  def update
  		@order_detail = OrderDetail.find(params[:id])
  		@order = @order_detail.order
		  if @order_detail.update(order_detail_params)
		  	flash[:success] = "製作ステータスを変更しました"

		  	if @order_detail.created_status == "製作中" #製作ステータスが「製作中」なら下が入る
			    @order.update(order_status: 2) #注文ステータスを「製作中」に更新

		# 上記の条件に当てはまらなければ、商品の個数の特定製作ステータスが「製作l完了」の商品をカウント
	  #  数が一致すれば、全ての商品の製作ステータスが「製作完了」だとわかる
			elsif @order.order_details.count ==  @order.order_details.where(created_status: "製作完了").count
			@order.update(order_status: 3) #注文ステータスを「発送準備中]に更新

			elsif @order_detail.created_status == "発送" #製作ステータスが「製作中」なら下が入る
			    @order.update(order_status: 4) #注文ステータスを「製作中」に更新
			end

		    redirect_to admin_order_path(@order_detail.order)
		  else

		     render "show"
		  end
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:created_status)
  end


end
