class Question < ApplicationRecord
  belongs_to :user
  QUESTION_PARAMS = [:content,
    answers_attributes: [:id, :ans, :content, :check, :_destroy]].freeze

  validates :content, presence: true

  delegate :name, to: :user, prefix: true

  has_many :answers, dependent: :destroy

  accepts_nested_attributes_for :answers, allow_destroy: true
end
