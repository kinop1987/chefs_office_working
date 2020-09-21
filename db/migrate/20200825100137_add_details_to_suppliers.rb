class AddDetailsToSuppliers < ActiveRecord::Migration[6.0]
  def change
    add_column :suppliers, :name, :string, null: false
    add_column :suppliers, :telephone, :string, null: false
    add_column :suppliers, :pic, :string, null: false
    add_column :suppliers, :website, :string, null: false
  end
end
