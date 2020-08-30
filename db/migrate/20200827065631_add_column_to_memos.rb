class AddColumnToMemos < ActiveRecord::Migration[6.0]
  def change
    add_reference :memos, :order, null: false, foreign_key: true
  end
end
