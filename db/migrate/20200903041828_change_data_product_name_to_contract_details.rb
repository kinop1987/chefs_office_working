class ChangeDataProductNameToContractDetails < ActiveRecord::Migration[6.0]
  def change
    change_column :contract_details, :product_name, :string
  end
end
