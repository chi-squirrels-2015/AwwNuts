require 'spec_helper'

describe UsersController do
  let!(:user) { User.new }

  describe 'GET #new' do
    it "creates a new, unsaved, user object" do
      get :new
      expect(assigns(:user)).to be_instance_of User
      expect(assigns(:user).id).to be_nil
    end
  end

  describe 'POST #create' do
    context "when valid params are passed" do
      it "creates a new User" do
        expect{ post :create, user: user_params }.to change{ User.count }.by(1)
      end

      it "assigns a newly created user to @user" do
        post :create, user: user_params
        expect(assigns(:user)).to eq(User.last)
      end

      it "redirects to the users profile" do
        post :create, user: user_params
        expect(response).to redirect_to(user_path)
      end
    end
  end
end

def user_params
  {username: "user1234",
   first_name: "Testy",
   last_name: "McTesterson",
   email: "testy@mctesterson.com",
   password: "password",
   avatar_url: "http://google.com",
   catch_phrase: "Ayyyyy!"}
end