class AddColumnToContracts < ActiveRecord::Migration[6.0]
  def change
    add_column :contracts, :comment, :string
  end
end
