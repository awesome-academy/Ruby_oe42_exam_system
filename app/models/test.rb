class Test < ApplicationRecord
  belongs_to :user
  belongs_to :exam

  TEST_PARAMS = [:exam_id, :time_test, :actual_test_time,
    questions_exam_ids: [],
    test_questions_exams_attributes: [:id, :test_id, :questions_exam_id,
      :answer_id_choose]].freeze

  delegate :suppervisor, :trainee, :admin, :name, to: :users
  delegate :name, to: :users

  has_many :test_questions_exams, dependent: :destroy
  has_many :questions_exams, through: :test_questions_exams

  accepts_nested_attributes_for :test_questions_exams, allow_destroy: true
end
