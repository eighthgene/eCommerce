class ProductsController < ApplicationController
  def index
    @category = Category.find(params[:category_id])
    @products = @category.products.order(:title)
    @partial = params[:view] || "/layouts/grid" || "/layouts/list" # "grid", "list", etc.
  end

  def show
  end
end
