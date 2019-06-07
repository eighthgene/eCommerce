class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :title, null: false
      t.text :description
      t.float :price, precision: 10, scale: 2
      t.string :image
      t.integer :orders, default: 0
      t.integer :views, default: 0
      t.references :category, index: true
      t.timestamps
    end
  end
end
