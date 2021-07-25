class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_product, only: [:show]

  def index
    @products = Product.all.order('created_at DESC')
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end

    def show
      @product = Product.find(params[:id])
    end
  end

  private

  def product_params
    params.require(:product).permit(:product_name, :product_explain, :category_id, :product_statu_id, :cost_id,
                                    :seller_place_id, :need_day_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
