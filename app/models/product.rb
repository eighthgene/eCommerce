class Product < ApplicationRecord
  belongs_to :category
  has_many :order_items

  def self.search(search)
    if search
      where("title LIKE ?", "%#{search}%")
    else
      all
    end
  end
end
