require "rails_helper"

RSpec.describe User, type: :model do
  describe "validates" do
    let(:user){FactoryBot.create :user, name: "Hien", email: "Hien@gmail.com", role: "suppervisor" }

    let(:user1) {User.new}
    context "with field name" do
      it { should validate_presence_of(:name) }
      it { should validate_length_of(:name)}

      it "it not valid without a name" do
        expect(user1).not_to be_valid
      end

      it "when name too long" do
        user1.name = "tolonggggggggggggggggggggggggggggggggggggggggggggggggggg"
        expect(user1).not_to be_valid
      end

      it "when name valid" do
        user.name = "Hien"
        expect(user).to be_valid
      end

      it { should validate_length_of(:name).is_at_most(Settings.max_name) }
    end

    context "with field email" do
      it "when email invalid" do
        should_not allow_value("email@invailid@gmail.com").for(:email)
      end

      it "when email valid" do
        should allow_value("test@gmail.com").for(:email)
      end
    end

    context "with field password" do
      it { should validate_presence_of(:password) }
      it { should validate_length_of(:password).is_at_least(Settings.min_pass) }
    end
  end

  describe "associations" do
    it { should have_many(:exams).dependent(:destroy) }
    it { should have_many(:questions).dependent(:destroy) }
    it { should have_many(:subjects).dependent(:destroy) }
  end
  describe "Enum" do
    it { should define_enum_for(:role) }
  end
end
