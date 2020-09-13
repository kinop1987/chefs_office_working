class ChangeDataInventoryMonthToInventoriese < ActiveRecord::Migration[6.0]
  def change
    change_column :inventories, :inventory_month, :string
  end
end
