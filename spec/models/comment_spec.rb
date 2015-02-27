require 'spec_helper'

describe Comment do

	context 'without data' do
	
		let(:comment) { Comment.new( content: "", commentable_type: "Question", commentable_id: 1) }

		it 'should not save if any data is invalid' do
			expect{ comment.save }.to_not change { Comment.count }
		end
	end
	let(:author)  { User.create(id: 1, username: "Nate", email: "nate@dbc.com", password_digest: "password") }
	let(:answer)  { Question.create(id: 1, title: "Test Title", content: "Fake answer content", author_id: 1, )}
	let(:comment) { Comment.new( author: author, content: "Fake comment", commentable_type: "Question", commentable_id: 1) }

	it 'should have content' do
		expect(comment.content). to eq("Fake comment")
	end

	it 'should have a commentable_type' do
		expect(comment.commentable_type). to eq("Question")
	end

	it 'should have a commentable_id' do
		expect(comment.commentable_id). to eq(1)
	end

	it 'should have an author' do
		expect(comment.author.username). to eq("Nate")
	end
end
