class AddDetailsToVouchers < ActiveRecord::Migration[6.0]
  def change
    add_column :vouchers, :comment, :string
    add_column :vouchers, :confirm, :boolean, null: false, default: false
  end
end
