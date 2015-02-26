require "spec_helper"

describe Answer do
  let(:bill) {User.new(username: "Bill Gates", email: "thebill@gmail.com", password: "ilovewindows")}
  let(:steve) {User.new(username: "Steve Jobs", email: "kingsteve@gmail.com", password: "elegant")}
  let(:question) {Question.new(title: "How do I install Windows?", content: "I have no idea, I need help", author: bill)}
  let(:answer) {Answer.new(content: "Just buy a mac. You'll never have to worry about anything ever again.", question: question, author: steve)}

  it "belongs to an author" do
    expect(answer.author.username).to eq("Steve Jobs")
  end

  it "has content" do
    expect(answer.content).to eq("Just buy a mac. You'll never have to worry about anything ever again.")
  end
end

describe Validations do
  let(:steve) {User.new(username: "Steve Jobs", email: "kingsteve@gmail.com", password: "elegant")}
  let(:answer) {Answer.new}

  it "has an error if answer has no content" do
    answer.author = steve
    answer.valid?
    expect(question.errors[:content]).to_not be_empty
  end

  it "has an error if author is empty" do
    answer.content = "Just buy a mac. You'll never have to worry about anything ever again."
    answer.valid?
    expect(question.error[:author]).to_not be_empty
  end
end
