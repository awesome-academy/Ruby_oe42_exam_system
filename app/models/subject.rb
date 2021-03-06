class Subject < ApplicationRecord
  belongs_to :user

  SUBJECT_PARAMS = %i(name description).freeze

  delegate :name, to: :user, prefix: true
  has_many :exams, dependent: :destroy

  validates :name, presence: true, length: {maximum: Settings.max_name_subject}
  validates :description, presence: true,
            length: {minimum: Settings.min_des, maximum: Settings.max_des}
  validates :user_id, presence: true
end
