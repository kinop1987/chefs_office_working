class RemoveUserFromMemos < ActiveRecord::Migration[6.0]
  def change
    remove_column :memos, :user_id, :references
  end
end
