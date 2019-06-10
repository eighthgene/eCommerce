class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.float :subtotal, null: false, precision: 10, scale: 2
      t.boolean :is_paid, default: false
      t.integer :status, default: 0
      t.integer :user_id, default: 0
      t.timestamps
    end
  end
end
