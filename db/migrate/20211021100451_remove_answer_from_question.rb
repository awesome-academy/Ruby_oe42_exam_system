class RemoveAnswerFromQuestion < ActiveRecord::Migration[6.0]
  def change
    remove_column :questions, :answer, :string
  end
end
