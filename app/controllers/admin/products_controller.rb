class Admin::ProductsController < ApplicationController

  # before_action :set_product, only: [:show, :edit, :update]
  # before_action :set_genres, only: [:new, :edit, :index, :create, :update]
  before_action :authenticate_admin!

  def index
    @products = Product.all.page(params[:page]).per(8)
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if params[:product][:price].present? && params[:product][:name].present? && params[:product][:explanation].present? && params[:product][:genre_id].present? && params[:product][:image].present?
      # 価格は半角数字0 ~ 9のみ登録可能で、それ以外は登録出来ないようにするif文
      if params[:product][:price].to_s.ord >= 48 && params[:product][:price].to_s.ord <= 57
        # 保存に成功した時のif文
        if @product.save
          redirect_to admin_products_path
          flash[:success] = "商品を登録しました"
        else
          flash[:danger] = "必要情報を入力してください"
          render "admin/products/new"
        end
      else
        flash[:danger] = "価格は半角数字で記入してください"
        render "admin/products/new"
      end
    else
      # 格カラムが空白で保存されなかった場合
      unless @product.save
        flash[:danger] = "必要情報を入力してください"
        render "admin/products/new"
      end
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    # 商品のカラムが存在しているかどうかのif文
    if params[:product][:price].present? && params[:product][:name].present? && params[:product][:explanation].present? && params[:product][:genre_id].present? && params[:product][:image].present?
      # 価格は半角数字のみ登録可能で、それ以外は登録出来ないようにするif文
      if params[:product][:price].to_s.ord >= 48 && params[:product][:price].to_s.ord <= 57
        # 更新に成功した時のif文
        if @product.update(product_params)
          redirect_to admin_product_path(@product.id)
          flash[:success] = "商品を更新しました"
        else
          flash[:danger] = "必要情報を入力してください"
          render "admin/products/edit"
        end
      else
        flash[:danger] = "価格は半角数字で記入してください"
        # redirect_to edit_admins_product_path(@product.id)
        render "admin/products/edit"
      end
    else
      # 格カラムが空白で更新されなかった場合
      unless @product.update(product_params)
        flash[:danger] = "必要情報を入力してください"
        render "admin/products/edit"
      end
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :explanation, :image, :genre_id, :price, :sales_status)
  end
end
