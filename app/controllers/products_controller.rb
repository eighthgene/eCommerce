class ProductsController < ApplicationController

  def index
    if params[:category_id]
      @category = Category.find(params[:category_id])
      @products = @category.products.order(:title)
    elsif params[:select_param] == 'all'
      @select_param = params[:select_param]
      @products = Product.all
      @type = 'All products'
    else
      @select_param = params[:select_param]
      @products = Product.order("#{@select_param} DESC").first(10)
      @type = param_type(@select_param)
    end
    @partial = params[:view] || "/layouts/grid" || "/layouts/list" # "grid", "list", etc.
  end

  def show
    @product = Product.find(params[:id])
    if session[:products_views]
      unless session[:products_views].include?(params[:id])
        session[:products_views].push(params[:id])
        @product.update_attribute(:views, @product.views + 1)
      end

      @category = Category.find @product.category_id
      @order_item = current_order.order_items.new
    end
  end

  def param_type(type)
    case type
    when 'created_at'
      "New arrival"
    when 'views'
      'Populars'
    else
      # type code here
    end
  end

end
