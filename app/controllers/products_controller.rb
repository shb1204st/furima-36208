class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :search, :keyword_search, :category_search, :detail_search]
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]
  before_action :search_product, only: [:index, :show, :search, :category_search, :detail_search]

  def index
    @products = Product.all.order('created_at DESC')
    set_product_column 
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
  end

  def show
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to product_path
    else
      render :edit
    end
  end

  def destroy
    redirect_to root_path if @product.destroy
  end

  def search
    @results = @p.result.includes(:user)
  end

  def category_search
    @results = @p.result.includes(:user)
  end

  def detail_search
    @results = @p.result.includes(:user)
    set_product_column 
  end

  private

  def product_params
    params.require(:product).permit(:product_name, :product_explain, :category_id, :product_statu_id, :cost_id,
                                    :seller_place_id, :need_day_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index if current_user.id != @product.user.id || @product.buy
  end

  def search_product
    @p = Product.ransack(params[:q])
  end

  def set_product_column
    @product_name = Product.select("product_name").distinct
  end

end
