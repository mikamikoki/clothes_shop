class Customer::ProductsController < ApplicationController

before_action :authenticate_customer!, only: [:show]

 def index
    @genres = Genre.where(is_genres_status: true)
   if params[:genre_id].nil?
      @products_all = Product.joins(:genre).where(genres: { is_genres_status: true }).where(sales_status: true).order(created_at: :desc)
      # ジャンルが有効かつ商品も販売中の商品のみ表示させる
      @products = @products_all.page(params[:page]).per(8)
      @index = "商品"
   else
      @products_all = Product.joins(:genre).where(genres: { is_genres_status: true, id: params[:genre_id] }).where(sales_status: true).order(created_at: :desc)
      @products = @products_all.page(params[:page]).per(8)
      @index = Genre.find( params[:genre_id]).name
   end
 end

 def show
   @products = Product.all
   @product = Product.find(params[:id])
   @cart_product = CartProduct.new
   @genres = Genre.all
 end

  private
  def product_params
		parmas.require(:product).permit(:name, :explanation, :price, :image, :sales_status)
	end


end