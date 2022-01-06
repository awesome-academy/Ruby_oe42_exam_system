require "rails_helper"

RSpec.describe Exam, type: :model do
  describe "associations" do
    it { should belong_to(:subject) }
    it { should belong_to(:user) }
    it { should have_many(:questions_exams).dependent(:destroy) }
    it { should have_many(:questions).through(:questions_exams) }
    it { should have_many(:tests).dependent(:destroy) }
    it { should accept_nested_attributes_for(:questions_exams).allow_destroy(true) }
  end
end
