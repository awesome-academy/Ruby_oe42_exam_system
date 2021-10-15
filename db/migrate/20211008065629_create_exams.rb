class CreateExams < ActiveRecord::Migration[6.0]
  def change
    create_table :exams do |t|
      t.references :users, null: false, foreign_key: true

      t.timestamps
    end
  end
end
