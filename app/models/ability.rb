# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize user
    return if user.blank?

    can :manage, Test, user_id: user.id
    can :read, [Question, QuestionsExam, Subject, Exam, Answer]
    return unless user.admin? || user.suppervisor?

    can :manage, :all
  end
end
