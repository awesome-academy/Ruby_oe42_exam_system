require "rails_helper"

RSpec.describe UsersController, type: :controller do
  let(:user){FactoryBot.create :user}

  before do
    sign_in user
  end

  describe "POST #create" do
    context "with valid attributes" do
      before do
        post :create, params: {user: {
          name: "Hien",
          email: "test_email@gmail.com",
          role: "trainee",
          password: "test_email@gmail.com",
          password_confirmation: "test_email@gmail.com"
        }}
      end
      it "display success" do
        expect(flash[:success]).to eq I18n.t("success")
      end

      it "redirect to root page" do
        expect(response).to redirect_to root_url
      end
    end

    context "with invalid attributes" do
      before do
        post :create, params: {user: {
          name: "Hien",
          email: "",
          role: "suppervisor",
          password: "test_email@gmail.com",
          password_confirmation: "test_email@gmail.com"
        }}
      end

      it "display danger" do
        expect(flash[:danger]).to eq I18n.t("fail")
      end

      it "render new" do
        expect(response).to render_template :new
      end
    end
  end

  describe "GET #new" do
    before{get :new}

    it "should have a status code of 302" do
      expect(response.status).to eq(302)
    end
  end

  describe "GET #index" do
    before{get :index}

    let!(:user_0){FactoryBot.create :user}
    let!(:user_1){FactoryBot.create :user}
    let!(:user_2){FactoryBot.create :user}

    it "assign users" do
      expect(assigns(:users)).to eq [user, user_0, user_1, user_2]
    end
  end
end
