class ChangeDataConfirmToVouchers < ActiveRecord::Migration[6.0]
  def change
    change_column :vouchers, :confirm, :integer, null: false
  end
end
