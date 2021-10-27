class Answer < ApplicationRecord
  belongs_to :question
  validates :ans, presence: true
  validates :content, presence: true
  enum check: {right: 0, wrong: 1}
end
