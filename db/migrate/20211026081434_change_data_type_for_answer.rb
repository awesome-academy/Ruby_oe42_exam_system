class ChangeDataTypeForAnswer < ActiveRecord::Migration[6.0]
  def change
    change_column :answers, :check, :integer
  end
end
