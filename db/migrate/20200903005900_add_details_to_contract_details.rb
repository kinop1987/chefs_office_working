class AddDetailsToContractDetails < ActiveRecord::Migration[6.0]
  def change
    add_column :contract_details, :delivery_date, :date, null: false
    add_column :contract_details, :product_unit, :string, null: false
  end
end
