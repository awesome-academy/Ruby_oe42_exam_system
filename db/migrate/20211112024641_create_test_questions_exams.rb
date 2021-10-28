class CreateTestQuestionsExams < ActiveRecord::Migration[6.0]
  def change
    create_table : do |t|
        t.references :test, null: false, foreign_key: true
        t.references :questions_exam, null: false, foreign_key: true
        t.integer :answer_id_choose

        t.timestamps
    end
  entest_questions_examsd
end
