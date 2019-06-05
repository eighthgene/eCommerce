class ProductsController < ApplicationController
  def index
    @category = Category.find(params[:category_id])
    @products = @category.products.order(:title)
  end

  def show
  end
end
