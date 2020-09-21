class CreateContracts < ActiveRecord::Migration[6.0]
  def change
    create_table :contracts do |t|
      t.references :order, null: false, foreign_key: true
      t.references :supplier, null: false, foreign_key: true
      t.integer :total_price, null: false
      t.date :delivery_date, null: false
      t.timestamps
    end
  end
end
