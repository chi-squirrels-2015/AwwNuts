class User < ActiveRecord::Base
  has_secure_password

  has_many :questions, foreign_key: :author_id
  has_many :answers, foreign_key: :author_id
  has_many :answered_questions, through: :answers, source: "question"

  before_validation :downcase_email

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, format: { with: /\w+@\w+\.\w+/i }
  validates :avatar_url, format: { with: /\Ahttps?:\/\//i }

  def full_name
    "#{first_name} #{last_name}".titleize
  end

  private

  def downcase_email
    self.email = self.email.downcase if self.email.present?
  end
end