require 'spec_helper'

describe CommentsController do
	let!(:user) { User.create(user_test_params) }
	let!(:question) { Question.create(question_test_params) }
  let!(:comment) { Comment.new(comment_test_params) }


  describe 'GET #new' do
    it "creates a new, unsaved, comment" do
      get :new, question_id: 1
      expect(assigns(:comment)).to be_instance_of Comment
      expect(assigns(:comment).id).to be_nil
    end
  end

  describe 'POST #create' do
    context "when valid params are passed" do
      it "creates a new Comment" do
      	session[:user_id] = user.id
      	allow(comment).to receive(:current_user).with(:user)

        expect{ post :create, question_id: 1, comment: comment_test_params }.to change{ Comment.count }.by(1)
      end
    end

    context "when invalid params are passed" do
      xit "assigns a newly created but unsaved comment as @comment" do
        post :create, question_id: 1, comment: { content: "" }
        expect(assigns(:comment).id).to be_nil
      end

      xit "re-renders the comment form" do
        post :create, comment: { content: "" }
        expect(response).to render_template :new
      end
    end
  end
end

def comment_test_params
  { content: "This is a fake comment. It's very commenty, and egregious. Sesquipedalian is my new favorite word.",
  	commentable_type: "Question",
  	commentable_id: Question.find_by(title: "Test Title") }
end

def question_test_params
	{ author: User.find_by(username: "user1234"),
		title: "Test Title",
		content: "This is the best fake question ever, or is it?" }
end

def user_test_params
  {username: "user1234",
   first_name: "Testy",
   last_name: "McTesterson",
   email: "testy@mctesterson.com",
   password: "password",
   avatar_url: "http://google.com",
   catch_phrase: "Ayyyyy!"}
end
