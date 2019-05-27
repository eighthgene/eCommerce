class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.integer :quantity, null: false, default: 0
      t.decimal :price, null: false, precision: 10, scale: 2
      t.references :order, index: true
      t.timestamps
    end
  end
end
