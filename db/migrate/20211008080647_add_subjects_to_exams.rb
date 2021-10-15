class AddSubjectsToExams < ActiveRecord::Migration[6.0]
  def change
    add_reference :exams, :subjects, null: false, foreign_key: true
  end
end
