class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.decimal :sub_total, null: false, precision: 10, scale: 2
      t.timestamps
    end
  end
end
