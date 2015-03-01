class User < ActiveRecord::Base
  has_secure_password

  has_many :questions, foreign_key: :author_id
  has_many :answers, foreign_key: :author_id
  has_many :comments, foreign_key: :author_id
  has_many :answered_questions, through: :answers, source: "question"

  has_many :cast_votes, class_name: "Vote", foreign_key: :voter_id

  has_many :received_question_votes, through: :questions, source: :votes
  has_many :received_answer_votes, through: :answers, source: :votes

  before_validation :downcase_email

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, format: { with: /\w+@\w+\.\w+/i }
  validates :avatar_url, format: { with: /\Ahttps?:\/\//i }, allow_blank: true


  def total_votes
    self.received_question_votes.count + self.received_answer_votes.count
  end

  def full_name
    "#{first_name} #{last_name}".titleize
  end

  def avatar
    if avatar_url.blank?
      "https://robohash.org/o24ruwlekfj239487wejfn23498ty3ejfbn3oity483fgjn?size=300x300"
    else
      avatar_url
    end
  end

  private

  def downcase_email
    self.email = self.email.downcase if self.email.present?
  end
end
