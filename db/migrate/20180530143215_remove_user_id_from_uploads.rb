class RemoveUserIdFromUploads < ActiveRecord::Migration[5.1]
  def change
    remove_foreign_key :uploads, :user_id
    remove_column :uploads, :user_id, :integer
  end
end
