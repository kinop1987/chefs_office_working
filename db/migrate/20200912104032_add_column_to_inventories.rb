class AddColumnToInventories < ActiveRecord::Migration[6.0]
  def change
    add_reference :inventories, :supplier, index: true
  end
end
