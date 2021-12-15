require "rails_helper"

RSpec.describe Subject, type: :model do
  it "has a vavid factory"
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:user_id) }
  it { should validate_length_of(:name)}
  it { should validate_length_of(:description)}
  describe "associations" do
    it { should belong_to(:user) }
  end
end
