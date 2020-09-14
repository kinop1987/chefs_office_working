class CreateVoucherDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :voucher_details do |t|
      t.string :product_name, null:false
      t.integer :unit_price, null:false
      t.string :product_unit, null:false
      t.integer :total_price, null:false
      t.date :delivery_date, null:false
      t.references :order, null:false, foreign_key: true
      t.references :supplier, null:false, foreign_key: true
      t.references :voucher, null:false, foreign_key: true

      t.timestamps
    end
  end
end