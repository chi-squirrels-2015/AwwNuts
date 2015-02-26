class Comment < ActiveRecord::Base

	validates :content, presence: true
	validates :author, presence: true

	belongs_to :author, class_name: "User"
	belongs_to :commentable, polymorphic: true
end
