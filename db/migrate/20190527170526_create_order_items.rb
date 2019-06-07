class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.integer :product_id
      t.integer :order_id
      t.integer :quantity, null: false, default: 0
      t.float :unit_price, null: false, precision: 10, scale: 2
      t.float :total_price, null: false, precision: 10, scale: 2
      t.timestamps
    end
  end
end
