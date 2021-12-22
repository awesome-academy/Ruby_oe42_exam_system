require "rails_helper"

RSpec.describe QuestionsController, type: :controller do
  let(:user){FactoryBot.create :user}

  before do
    sign_in user
  end
end
