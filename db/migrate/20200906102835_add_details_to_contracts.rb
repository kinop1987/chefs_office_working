class AddDetailsToContracts < ActiveRecord::Migration[6.0]
  def change
    add_column :contracts, :confirm, :integer, null: false
  end
end
