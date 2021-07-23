class ProductsController < ApplicationController

  def index
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)
  end




  private

  def product_params
    params.require(:product).permit(:image).merge(user_id: current_user_id)
  end

end
