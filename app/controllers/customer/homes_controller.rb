class Customer::HomesController < ApplicationController

  def top
    #=> :asc,古い順 :desc,新しい順
    @products_all = Product.joins(:genre).where(genres: { is_genres_status: true }).where(sales_status: true).order(created_at: :desc)
    @genres = Genre.where(is_genres_status: true)
    # @product = Product.find(params[:id])
    @products = Kaminari.paginate_array(@products_all).page(params[:page]).per(4)
  end


    def about
    end

  private
   def product_params
     parmas.require(:product).permit(:name, :explanation, :price, :sales_status, :genre_id, product_images_images: [])
   end
end