class CreateTests < ActiveRecord::Migration[6.0]
  def change
    create_table :tests do |t|
      t.references :users, null: false, foreign_key: true
      t.references :exams, null: false, foreign_key: true
      t.datetime :time_test
      t.float :total_score

      t.timestamps
    end
  end
end
