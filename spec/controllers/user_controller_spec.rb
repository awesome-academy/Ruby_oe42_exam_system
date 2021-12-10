require "rails_helper"

RSpec.describe UsersController, type: :controller do
  let(:suppervisor){FactoryBot.create :user, name: "Name 2", email: "test123456789@mail.com", role: "suppervisor"}
  let(:trainee){FactoryBot.create :user, name: "Name 2", email: "test12345678910@mail.com", role: "trainee"}


  before{login_as suppervisor}

  describe "GET /index" do
    it "should render template index" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe "GET new" do
    before{get :new}
    it "should render template new" do
      expect(response).to render_template :new
    end

    it "should assigns a blank user to the view" do
      expect(assigns(:user)).to be_a_new User
    end
  end

  describe "POST /create" do
    context "user is not supervisor" do
      before do
        login_as trainee
        post :create
      end

      it "should redirect to root" do
        expect(response).to redirect_to root_url
      end
    end

    context "when user information is valid" do
      before do
        post :create, params: {user: {name: "Name", email: "a33931@thanglong.edu.vn", role: "trainee", password: "doanxemnao", password_confirmation: "doanxemnao"}}
      end

      it "should flash success information" do
        expect(flash[:success]).to be_present
      end

      it "should redirect to home page" do
        expect(response).to redirect_to root_url
      end
    end

    context "when user information is invalid" do
      before do
        post :create, params: {user: {name: "Name", email: "a33931@tlu.vn", role: "trainee", password: "doanxemnao", password_confirmation: "doanxemnao"}}
      end
      it "should render the new" do
        expect(response).to render_template("new")
      end
    end
  end
end
