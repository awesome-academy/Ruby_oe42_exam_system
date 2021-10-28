class QuestionsExam < ApplicationRecord
  belongs_to :exam
  belongs_to :question

  QUESTIONS_EXAM_PARAMS = [:exam_id, question_id: [], question_ids: []].freeze
  delegate :content, to: :question, prefix: true

  has_many :test_questions_answers, dependent: :destroy
  has_many :tests, through: :test_questions_exams

  private
  def add_exam_question_answers
    question.answers.each do |answer|
      exam_question_answers.create! ans: answer.ans, content: answer.content,
                                    check: answer.check
    end
  end
end
