class ChangeColumnNameSubjectsIdToSubjectIdInExam < ActiveRecord::Migration[6.0]
  def change
    rename_column :exams, :subjects_id, :subject_id
    rename_column :exams, :users_id, :user_id
    rename_column :questions_exams, :exams_id, :exam_id
    rename_column :questions_exams, :questions_id, :question_id
    rename_column :tests, :exams_id, :exam_id
    rename_column :tests, :users_id, :user_id
  end
end
