require "rails_helper"

RSpec.describe Question, type: :model do
  let(:user){FactoryBot.create :user}
  let(:question){FactoryBot.create :question, user: user}

  it { should validate_presence_of(:content) }
  it { should accept_nested_attributes_for(:answers).allow_destroy(true) }

  describe "associations" do
    it { should belong_to(:user) }
    it { should have_many(:answers).dependent(:destroy) }
    it { should have_many(:questions_exams).dependent(:destroy) }
    it { should have_many(:exams).through(:questions_exams) }
  end
end
