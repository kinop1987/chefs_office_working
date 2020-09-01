class CreateContractDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :contract_details do |t|
      
      t.integer :unit_price
      t.integer :quantity, null: false
      t.integer :product_name, null: false
      t.integer :total_price
      t.references :contract , null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true
      t.references :supplier, null: false, foreign_key: true

      t.timestamps
    end
  end
end
