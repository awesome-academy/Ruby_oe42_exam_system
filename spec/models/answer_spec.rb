require "rails_helper"

RSpec.describe Answer, type: :model do
  it { should validate_presence_of(:ans) }
  it { should validate_presence_of(:content) }
  describe "associations" do
    it { should belong_to(:question) }
  end
  describe "Enum" do
    it { should define_enum_for(:check) }
  end
end
