require 'spec_helper'

describe Vote do
  let(:user) { User.create!(first_name: "John", last_name: "Doe", username: "test", password: "test", email: "test@test.com") }
  let(:question) { user.questions.create!(title: "test", content: "test") }
  let(:vote) { question.votes.new(voter: user, count: 0) }

  describe '#up' do
    it "increases a vote's count" do
      vote.count = 0
      expect{ vote.up }.to change{ vote.count }.by(1)
    end

    context "when the count is 1" do
      it "doesn't increase the count" do
        vote.count = 1
        expect{ vote.up }.to_not change{ vote.count }
      end
    end
  end

  describe '#down' do
    it "decreases a vote's count" do
      vote.count = 1
      expect{ vote.down }.to change{ vote.count }.by(-1)
    end

    context "when the count is -1" do
      it "doesn't decrease the count" do
        vote.count = -1
        expect{ vote.down }.to_not change{ vote.count }
      end
    end
  end

  describe "Validations" do
    it "only allows a voter to vote once per votable" do
      vote.save
      duplicate_vote = Vote.new(vote.attributes)
      duplicate_vote.save
      expect(duplicate_vote.errors).to include(:voter)
    end

    it "must have a votable" do
      vote.votable = nil
      vote.save
      expect(vote.errors).to include(:votable)
    end

    it "must have a valid votable type" do
      vote.votable = user
      vote.save
      expect(vote.errors).to include(:votable_type)
    end

    it "count must be within range" do
      vote.count = -2
      vote.save
      expect(vote.errors).to include(:count)
    end
  end

  describe "Associations" do
    it "belongs to a voter" do
      expect(vote.voter).to eq(user)
    end

    it "belongs to a votable" do
      expect(vote.votable).to eq(question)
    end
  end
end