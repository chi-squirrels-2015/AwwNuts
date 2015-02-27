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

      it "sets the current_user" do
        expect(current_user.email).to eq("test@test.com")
      end
    end

    context "when given an invalid email/password combination" do
      pending
    end
  end

  describe 'GET #destroy' do
    pending
  end
end