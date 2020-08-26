class ProductsController < ApplicationController
  def new
    @product =Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def product_params
    params.require(:product).permit(:name,:text,:price,:category_id,:status_id,:burden_id,:area_id,:day_id)
  end
end
