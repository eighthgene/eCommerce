class Order < ApplicationRecord
  has_many :order_items
  before_save :set_subtotal

  public

  def update_user(user_id)
    update_attribute(:user_id, user_id)
  end

  def update_status_paid
    update_attribute(:is_paid, true)
  end


  def subtotal
    order_items.collect {|order_item| order_item.valid? ? (order_item.unit_price * order_item.quantity) : 0}.sum
  end

  private

  def set_subtotal
    self[:subtotal] = subtotal
  end

end