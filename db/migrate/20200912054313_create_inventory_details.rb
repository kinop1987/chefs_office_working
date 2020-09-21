class CreateInventoryDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :inventory_details do |t|
      t.integer :unit_price, null: false
      t.integer :quantity, null: false
      t.integer :total_price, null: false
      t.string  :product_name, null: false
      t.string  :product_unit, null: false
      t.date    :inventroy_day, null: false
      t.references :inventory, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true
      t.timestamps
    end
  end
end
