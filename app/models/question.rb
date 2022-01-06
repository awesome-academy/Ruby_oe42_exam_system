class Question < ApplicationRecord
  belongs_to :user
  QUESTION_PARAMS = [:content,
    answers_attributes: [:id, :ans, :content, :check, :_destroy]].freeze
  scope :get_list, ->{select(:id, :content)}
  validates :content, presence: true

  delegate :name, to: :user, prefix: true
  has_many :answers, dependent: :destroy
  has_many :questions_exams, dependent: :destroy
  has_many :exams, through: :questions_exams

  accepts_nested_attributes_for :answers, allow_destroy: true
end
