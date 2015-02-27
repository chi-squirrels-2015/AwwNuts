require 'spec_helper'

describe QuestionsController do
  let!(:question) { Question.new }

  describe 'GET #new' do
    it "creates an instance of a new question" do
      get :new
      expect(assigns(:question)).to be_instance_of Question
      expect(assigns(:question).id).to be_nil
    end
  end

  describe 'GET #index' do
    it "lists all questions" do
      get :index
      expect(assigns(:questions).count).to eq(Question.all.count)
    end
  end

  describe 'GET #show' do
    let(:bill) {User.create!(username: "Bill Gates", email: "thebill@gmail.com", password: "ilovewindows")}
    let!(:question) { Question.create!(title: "How do I do this?", content: "I'm stuck", author: bill) }

    it "sassigns the requested question as @question" do
      get :show, id: question
      expect(assigns(:question)).to eq(question)
    end
  end

  describe 'POST #create' do
    let(:bill) {User.create!(username: "Bill Gates", email: "thebill@gmail.com", password: "ilovewindows")}

    describe "when valid params are passed" do
      it "creates a new question" do
        allow(@controller).to receive(:current_user) {bill}
        post :create, {question: {title: "Media driver is missing when installing Windows 8", content: "WTF"}}

        expect(Question.last.title).to eq("Media driver is missing when installing Windows 8")
      end
    end

    describe "when invalid params are passed" do
      it "doesn't save invalid question to the database" do
        allow(@controller).to receive(:current_user) {bill}
        post :create, {question: {title: "Media driver is missing when installing Windows 8"}}

        expect(Question.last).to eq(nil)
      end
    end
  end

  describe 'DELETE #destroy' do
    let(:bill) {User.create!(username: "Bill Gates", email: "thebill@gmail.com", password: "ilovewindows")}
    let!(:question) { Question.create!(title: "How do I do this?", content: "I'm stuck", author: bill) }


    it "assigns the selected question as @question" do
      delete :destroy, { id: question.to_param }
      expect(assigns(:question)).to eq(question)
    end

    it "destroys the question" do
      expect {
        delete :destroy, id: question.id
      }.to change(Question, :count).by(-1)
    end

    it "redirects to the questions list" do
      delete :destroy, id: question.id
      expect(response).to redirect_to(questions_path)
    end
  end
end