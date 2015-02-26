class Answer < ActiveRecord::Base
  belongs_to :author, class_name: "User"
  belongs_to :question

  has_many :comments, as: :commentable

  validates :content, :author, presence: true
end
