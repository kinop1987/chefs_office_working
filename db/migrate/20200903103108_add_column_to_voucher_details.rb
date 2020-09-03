class AddColumnToVoucherDetails < ActiveRecord::Migration[6.0]
  def change
    add_column :voucher_details, :quantity, :integer, null:false
  end
end
