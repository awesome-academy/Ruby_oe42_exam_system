class ChangeColumnNameFormUsersIdToUserIdInQuestion < ActiveRecord::Migration[6.0]
  def change
    rename_column :questions, :users_id, :user_id
  end
end
