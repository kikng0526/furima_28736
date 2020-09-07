class ManagementsController < ApplicationController
  before_action :authenticate_user!
  before_action :product_find, only:[:index, :create, :pay_item]

  def index
    @management = UserFurima.new
  end

  def create
    @management = UserFurima.new(management_params)
    if @management.valid?
      pay_item
      @management.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def management_params
    params.permit(:token, :text, :price, :postal_code, :area_id, :city, :address_line, :building_name, :phone_number, :product_id).merge(user_id: current_user.id)
  end

  def product_find
    @product = Product.find(params[:product_id])
  end


  def pay_item
    Payjp.api_key = 'sk_test_23ec2fb2d2e4e3df18c1b8e5'  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @product.price, # 商品の値段
      card: params[:token],   # カードトークン
      currency: 'jpy'          # 通貨の種類(日本円)
    )
  end
end
