class RenameInventroyDayColumnToInventoryDetails < ActiveRecord::Migration[6.0]
  def change
    rename_column :inventory_details, :inventroy_day, :inventory_day
  end
end
