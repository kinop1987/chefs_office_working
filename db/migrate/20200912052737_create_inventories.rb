class CreateInventories < ActiveRecord::Migration[6.0]
  def change
    create_table :inventories do |t|
      t.integer :total_price, null:false
      t.date   :inventory_month, null:false
      t.references :order, null:false, foreign_key: true
      t.timestamps
    end
  end
end
