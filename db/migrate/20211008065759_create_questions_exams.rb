class CreateQuestionsExams < ActiveRecord::Migration[6.0]
  def change
    create_table :questions_exams do |t|
      t.references :exams, null: false, foreign_key: true
      t.references :questions, null: false, foreign_key: true
      t.float :score

      t.timestamps
    end
  end
end
