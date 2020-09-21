class AddDetailsToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :name, :string, null: false
    add_column :orders, :address, :string, null: false
    add_column :orders, :telephone, :string, null: false
  end
end
