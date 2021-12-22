class AddFieldsFromUser < ActiveRecord::Migration[6.0]
  def self.up
    change_table :users do |t|
      ## Database authenticatable
      rename_column :users, :password_digest, :encrypted_password
      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      t.datetime :remember_created_at
    end
    add_index :users, :reset_password_token, unique: true
    add_index :users, :email, unique: true
  end

  def self.down
    rename_column :users, :password_digest, :encrypted_password
  end
end
