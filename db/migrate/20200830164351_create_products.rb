class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :product_name, null:false
      t.integer :product_price
      t.string :product_unit, null:false
      t.references :supplier, foreign_key: true

      t.timestamps
    end
  end
end
