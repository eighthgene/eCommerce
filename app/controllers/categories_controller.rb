class CategoriesController < ApplicationController
  def index
    #@categories = Category.all
    @categories = Category.joins(:products)
                      .select('categories.*, count(products.id) as products_count')
                      .group('categories.id')
                      .order(:title)

    @top_viewed = Product.order('views DESC').first(10)
  end


end
