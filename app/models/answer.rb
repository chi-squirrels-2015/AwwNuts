class Answer < ActiveRecord::Base
  belongs_to :author, class_name: "User"
  belongs_to :question

  has_many :comments, as: :commentable

  has_many :votes, as: :votable
  has_many :voters, through: :votes, source: :voter

  validates :content, :author, presence: true
  # validates :question_id, uniqueness: {scope: :author_id}


  def vote_count
    votes.pluck(:count).reduce(:+) || 0
  end

end
