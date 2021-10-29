class Exam < ApplicationRecord
  belongs_to :user
  belongs_to :subject

  EXAM_PARAMS = [:subject_id, question_ids: [], questions_exams_attributes:
    [:id, :exam_id, :question_id, :score]].freeze

  delegate :suppervisor, :trainee, :admin, to: :users
  delegate :name, to: :subjects

  has_many :questions, through: :questions_exams
  has_many :users, dependent: :destroy
  has_many :questions_exams, dependent: :destroy
  has_many :subjects, dependent: :destroy
  has_many :tests, dependent: :destroy

  accepts_nested_attributes_for :questions_exams, allow_destroy: true
end
