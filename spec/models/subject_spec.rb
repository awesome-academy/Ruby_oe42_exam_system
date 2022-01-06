require "rails_helper"

RSpec.describe Subject, type: :model do
  let(:user){FactoryBot.create :user}
  let(:subject){FactoryBot.create :subject, user: user}

  describe "validates" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:user_id) }
    it { should validate_length_of(:name)}
    it { should validate_length_of(:description)}
  end

  describe "associations" do
    it { should belong_to(:user) }
    it { should have_many(:exams).dependent(:destroy) }
  end
end
