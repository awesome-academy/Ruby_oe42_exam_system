require "rails_helper"

RSpec.describe QuestionsExam, type: :model do
  describe "associations" do
    it { should belong_to(:exam) }
    it { should belong_to(:question) }
  end
  describe "delegate" do
    it { should respond_to(:question_content) }
  end
end
