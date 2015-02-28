require 'spec_helper'

describe SessionsController do
  describe 'GET #new' do
    it "renders the login form" do
      get :new
      expect(response).to render_template("sessions/new")
    end
  end

  describe 'POST #create' do
    let!(:user) { User.create!(email: "test@test.com", password: "password", username: "fakeUser") }

    context "when given a matching email/password combination" do
      before do
        post :create, { email: "test@test.com", password: "password" }
      end

      it "redirects to the dashboard" do
        expect(response).to redirect_to(dashboard_path)
      end

      it "creates a session" do
        expect(session[:user_id]).to eq(user.id)
      end
    end

    context "when given an invalid email/password combination" do
      before do
        post :create, { email: "test@test.com", password: nil }
      end

      it "re-renders the login form" do
        expect(response).to render_template("sessions/new")
      end

      it "doesn't create a session" do
        expect(session[:user_id]).to be_nil
      end

      it "assigns the email to @email" do
        expect(assigns(:email)).to eq("test@test.com")
      end
    end
  end

  describe 'GET #destroy' do
    it "redirects to the root" do
      get :destroy
      expect(response).to redirect_to(root_path)
    end

    it "clears the session" do
      get :destroy
      expect(session[:user_id]).to be_nil
    end
  end
end