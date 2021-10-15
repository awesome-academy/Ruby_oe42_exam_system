class Subject < ApplicationRecord
  belongs_to :user

  validates :name, presence: true, length: {maximum: Settings.max_name_subject}
  validates :description, presence: true,
            length: {minimum: Settings.min_des, maximum: Settings.max_des}
end
