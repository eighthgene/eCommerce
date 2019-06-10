class Product < ApplicationRecord
  belongs_to :category
  has_many :order_items

  def inc_counter_views
  end
end
