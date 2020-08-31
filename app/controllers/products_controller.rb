class ProductsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :set_product, only: [:show, :destroy]

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

  def index
    @products = Product.includes(:user).order('created_at DESC')
  end

  def show
  end

  def destroy
    @product.destroy
    redirect_to root_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :text, :price, :image, :category_id, :status_id, :burden_id, :area_id, :day_id).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
