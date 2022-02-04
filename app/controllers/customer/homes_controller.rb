class Customer::HomesController < ApplicationController
  
  def top
    @products = Product.joins(:genre).where(genres: { is_genres_status: true }).where(sales_status: true).order("RANDOM()").limit(4)
    #=> :asc,古い順 :desc,新しい順
    @genres = Genre.where(is_genres_status: true)
  end

  
    def about
    end
   
  private
   def product_params
     parmas.require(:product).permit(:name, :explanation, :price, :image, :sales_status, :genre_id)
   end
end