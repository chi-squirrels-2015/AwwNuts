require 'spec_helper'

describe User do
  let(:user) { User.new(username: "user1234",
                        first_name: "Testy",
                        last_name: "McTesterson",
                        password: "password",
                        email: "testy@mctesterson.com",
                        avatar_url: "http://movingkidsforward.org/wp-content/uploads/2013/05/profile_default800x600.jpg",
                        catch_phrase: "You got it dude!") }

  describe '#username' do
    it "returns the username of a user" do
      expect(user.username).to eq("user1234")
    end
  end

  describe '#first_name' do
    it "returns the first name of a user" do
      expect(user.first_name).to eq("Testy")
    end
  end

  describe '#last_name' do
    it "returns the last_name of a user" do
      expect(user.last_name).to eq("McTesterson")
    end
  end

  describe '#email' do
    it "returns the email of a user" do
      expect(user.email).to eq("testy@mctesterson.com")
    end
  end

  describe '#avatar_url' do
    it "returns the avatar url of a user" do
      expect(user.avatar_url).to eq("http://movingkidsforward.org/wp-content/uploads/2013/05/profile_default800x600.jpg")
    end
  end

  describe '#catch_phrase' do
    it "returns the catch_phrase of a user" do
      expect(user.catch_phrase).to eq("You got it dude!")
    end
  end

  describe "validations" do
    let(:duplicate_user) { User.new(user.attributes) }

    context "username" do
      it "is required" do
        user.username = ""
        user.valid?
        expect(user.errors).to include(:username)
      end

      it "doesn't allow duplicates" do
        user.save
        duplicate_user.valid?
        expect(duplicate_user.errors).to include(:username)
      end
    end

    context "email" do
      it "is required" do
        user.email = ""
        user.valid?
        expect(user.errors).to include(:email)
      end

      it "doesn't allow duplicates" do
        user.save
        duplicate_user.valid?
        expect(duplicate_user.errors).to include(:email)
      end

      it "has the proper format" do
        user.email = "user@user"
        user.valid?
        expect(user.errors).to include(:email)
      end
    end

    context "avatar_url" do
      it "has the proper format" do
        user.avatar_url = "movingkidsforward.org/wp-content/uploads/2013/05/profile_default800x600.jpg"
        user.valid?
        expect(user.errors).to include(:avatar_url)
      end
    end
  end

  describe "associations" do
    let(:question) { Question.create!(title: "Fake Question", content: "fake", author: user) }
    let(:answer) { Answer.create!(content: "fake answer", author: user) }

    describe "questions" do
      it "returns a collection of questions" do
        expect(user.questions).to include(question)
      end
    end

    describe "answers" do
      it "returns a collection of answers" do
        expect(user.answers).to include(answer)
      end
    end

    describe "answered_questions" do
      it "returns a collection of answered_questions" do
        answer.question = question
        answer.saveg
        expect(user.answered_questions).to include(question)
      end
    end
  end
end