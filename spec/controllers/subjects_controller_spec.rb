require "rails_helper"

RSpec.describe SubjectsController, type: :controller do
  let(:user){FactoryBot.create :user}
  let(:user_1){FactoryBot.create :user}
  let(:trainee){FactoryBot.create :user, role: "trainee"}
  let(:subject){FactoryBot.create :subject, user: user}

  before do
    sign_in user
  end

  describe "GET #index" do
    before{get :index}

    let!(:subject_0){FactoryBot.create :subject, user: user}
    let!(:subject_1){FactoryBot.create :subject, user: user}
    let!(:subject_2){FactoryBot.create :subject, user: user}

    it "assign users" do
      expect(assigns(:subjects)).to eq [ subject_0, subject_1, subject_2]
    end

    it "render template index" do
      expect(response).to render_template :index
    end
  end

  describe "GET /new" do
    before {get :new}

    it "render template new" do
      expect(response).to render_template :new
    end
  end

  describe "POST /create" do
    context "with valid attributes" do
      before do
        post :create, params: {subject: {
          name: "Ruby on Rails",
          description: "description is test for fun"
        }}
      end
      it "display success" do
        expect(flash[:success]).to eq I18n.t("success_subject")
      end

      it "redirect to root page" do
        expect(response).to redirect_to subject_url
      end
    end
    context "with invalid attributes" do
      before do
        post :create, params: {subject: {
          name: "Ruby",
          description: "invalid"
        }}
      end

      it "display danger" do
        expect(flash[:danger]).to eq I18n.t("fail_subject")
      end

      it "render new" do
        expect(response).to render_template :new
      end
    end
  end

  describe "GET /show" do
    before(:each) do
      get :show, params: { id: subject.id}
    end

    it "render template show" do
      expect(response).to render_template :show
    end
  end

  describe "GET /edit" do
    before {get :edit, params: { id: subject.id}}

    it "render template edit" do
      expect(response).to render_template :edit
    end

  end

  describe "DELETE /destroy" do
    context "with log_in sup" do
      before {delete :destroy, params: {id: subject.id} }
      it "should success" do
        expect(flash[:success]).to eq I18n.t("deleted")
      end

      it "redirect to equest.referer || subjects_path page" do
        expect(response).to redirect_to request.referer || subjects_path
      end
    end

    context "with find subject" do
      before {delete :destroy, params: {id: 200000} }
      it "should fail" do
        expect(flash[:danger]).to eq I18n.t("subject_not_found")
      end

      it "redirect to subjects_path page" do
        expect(response).to redirect_to subjects_path
      end
    end
  end
end
