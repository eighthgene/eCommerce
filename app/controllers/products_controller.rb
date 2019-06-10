class ProductsController < ApplicationController

  def index
    @category = Category.find(params[:category_id])
    @products = @category.products.order(:title)
    @partial = params[:view] || "/layouts/grid" || "/layouts/list" # "grid", "list", etc.
  end

  def show
    @product = Product.find(params[:id])
    unless session[:products_views].include?(params[:id])
      session[:products_views].push(params[:id])
      @product.update_attribute(:views, @product.views + 1)
    end

    @category = Category.find @product.category_id
    @order_item = current_order.order_items.new

  end

end
