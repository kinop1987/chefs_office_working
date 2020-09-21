class CreateVouchers < ActiveRecord::Migration[6.0]
  def change
    create_table :vouchers do |t|
      t.integer :total_price, null: false
      t.date :delivery_date, null: false
      t.references :order, null: false, foreign_key: true
      t.references :supplier, null: false, foreign_key: true
      t.timestamps
    end
  end
end
