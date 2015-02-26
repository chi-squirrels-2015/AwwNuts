require 'spec_helper'

describe Comment do
	let(:author)  { User.create(id: 1, username: "Nate", email: "nate@dbc.com", password_digest: "password") }
	let(:answer)  { Question.create(id: 1, title: "Test Title", content: "Fake answer content", author_id: 1, )}
	let(:comment) { Comment.create( author_id: 1, content: "Fake comment", commentable_type: "Question", commmentable_id: 1) }

	it 'should have an author' do
		expect(comment.author.username). to eq("Nate")
	end
end
