class TestQuestionsExam < ApplicationRecord
  belongs_to :test
  belongs_to :questions_exam

  TEST_QUESTIONS_EXAM_PARAMS = [:answer_id_choose, :test_id,
    questions_exam_id: [], questions_exam_ids: []].freeze

  scope :get_list, ->{select(:id, :test_id, :questions_exam_id, :answer_id_choose)}

  validates :answer_id_choose, presence: true
end
