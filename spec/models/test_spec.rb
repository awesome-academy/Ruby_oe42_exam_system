require "rails_helper"

RSpec.describe Test, type: :model do
  describe "associations" do
    it { Test.reflect_on_association(:user).macro.should  eq(:belongs_to) }
    it { Test.reflect_on_association(:exam).macro.should  eq(:belongs_to) }
  end
end
