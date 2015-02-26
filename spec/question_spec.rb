require 'spec_helper'

describe Question do
  let(:bill) {User.new(username: "Bill Gates", email: "thebill@gmail.com", password: "ilovewindows")}
  let(:question) {Question.new(title: "How do I install Windows?", content: "I have no idea, I need help", author: bill)}

  it "belongs to an author" do
    expect(question.author.username).to eq("Bill Gates")
  end
end

describe Validations do
  let(:bill) {User.new(username: "Bill Gates", email: "thebill@gmail.com", password: "ilovewindows")}
  let(:question) {Question.new}

  it "has an error if the title field is empty" do
    question.content = "I have no idea, I need help"
    question.author = bill
    question.valid?
    expect(question.errors[:title]).to_not be_empty
  end

  it "has an error if the content field is empty" do
    question.title = "How to enable/disable click events in an AngularJS directive"
    question.author = bill
    question.valid?
    expect(question.errors[:content]).to_not be_empty
  end

  it "has an error if there is no author" do
    question.title = "How to enable/disable click events in an AngularJS directive"
    question.content = "I have no idea, I need help"
    question.valid?
    expect(question.errors[:author]).to_not be_empty
  end

  it "is a valid question if all fields are filled out correctly" do
    question.title = "How to enable/disable click events in an AngularJS directive"
    question.content = "I have no idea, I need help"
    question.author = bill
    question.valid?
    expect(question.errors).to be_empty
  end
end