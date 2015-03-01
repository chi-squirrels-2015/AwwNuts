require 'spec_helper'

describe AnswersController do
	let!(:jean) {User.create!(first_name: "Jean", last_name: "Picard", username: "Jean Luc Picard", password: "test", email: "cptjlp@gmail.com")}
	let!(:bill) {User.create!(first_name: "Bill", last_name: "Gates", username: "Bill Gates", email: "thebill@gmail.com", password: "ilovewindows")}

	let!(:question) {Question.create!(title: "How do I install Windows?", content: "I have no idea, I need help", author: bill)}
	let!(:answer) { Answer.new }

	describe "GET #new" do
		it "creates a new answer" do
			get :new, question_id: question.id
			expect(assigns(:answer)).to be_instance_of Answer
			expect(assigns(:answer).id).to be_nil
		end
	end

	describe "POST #create" do
		context "when valid params are passed" do
			before do
				allow(controller).to receive(:current_user) { jean }
			end

			it "creates a new answer object" do
				expect{ post :create, question_id: question.id, answer: {content: "Make it work."}}.to change{ Answer.count }.by(1)
			end

			it "assigns a newly created answer as @answer" do
				post :create, question_id: question.id, answer: {content: "Make it work."}
				expect(assigns(:answer)).to eq(Answer.last)
			end

			it "renders the show partial" do
				post :create, question_id: question.id, answer: {content: "Make it work."}
				expect(response).to render_template :"answers/_show"
			end
		end
	end

	context "when invalid params are passed" do
		it "assigns a newly created but unsaved answer as @answer" do
			post :create, question_id: question.id, answer: {content: "Make it work."}
			expect(assigns(:errors)).to_not be_empty
			expect(assigns(:answer).content).to eq("Make it work.")
		end

		it "redirect_to the question show page" do
			post :create, question_id: question.id, answer: {content: "Make it work."}
			expect(response).to redirect_to question
		end
	end

	describe "GET #edit" do
		let!(:answer) {Answer.create!(content: "Make it work.", question: question, author: jean)}

    it "assigns the selected answer as @answer" do
    	get :edit, question_id: question.id, id: answer.to_param
    	expect(assigns(:answer)).to eq(answer)
    end
  end

  describe "PUT #update" do
  	before do
  		@answer = Answer.create!(content: "Make it work.", question: question, author: jean)
  		put :update, question_id: question.id, id: @answer.to_param, answer: {content: "It worked."}
  		@answer.reload
  	end

		it "assigns the selected answer as @answer" do
			expect(assigns(:answer)).to eq(@answer)
		end

		it "changes @answer's attributes" do
			expect(@answer.content).to eq("It worked.")
		end
  end

  describe 'DELETE #destroy' do
  	let!(:answer) {Answer.create!(content: "Make it work.", question: question, author: jean)}

  	before do
  		allow(controller).to receive(:current_user) { jean }
  	end

    it "assigns the selected answer as @answer" do
      delete :destroy, question_id: question.id, id: answer.to_param
      expect(assigns(:answer)).to eq(answer)
    end

    it "destroys the answer" do
      expect {delete :destroy, question_id: question.id, id: answer.id }.to change{Answer.count}.by(-1)
    end

    it "redirects to the answers list" do
      delete :destroy, question_id: question.id, id: answer.id
      expect(response).to redirect_to(questions_path(question))
    end
  end
end
