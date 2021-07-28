class BuysController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :create]
  before_action :move_to_index, only: [:index, :new, :create]
  before_action :set_product, only: [:index, :create]

  def index
    @buy_address = BuyAddress.new
  end

  def new
  end

  def create
    @buy_address = BuyAddress.new(buy_params)
    if @buy_address.valid?
      pay_item
      @buy_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  
  def buy_params
    params.require(:buy_address).permit(:post_code, :seller_place_id, :city,:address, :build_name, :phone_num).merge(user_id: current_user.id, product_id: params[:product_id], token: params[:token])                                    
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @product.price,
      card: buy_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_index
    @product = Product.find(params[:product_id])
    redirect_to root_path if @product.buy
  end

  def set_product
    @product = Product.find(params[:product_id])
  end
  
end
