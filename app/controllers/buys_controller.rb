class BuysController < ApplicationController
  before_action :authenticate_user!, except: :index
  
  def index
    @buy_address = BuyAddress.new
  end

  def new
  end

  def create
    @buy_address = BuyAddress.new(buy_params)
    if @buy_address.valid?
      @buy_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  
  def buy_params
    params.require(:buy_address).permit(:post_code, :seller_place_id, :city,:address, :build_name, :phone_num).merge(user_id: current_user.id, product_id: params[:product_id])                                    
  end

end
