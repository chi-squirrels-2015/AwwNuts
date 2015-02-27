class User < ActiveRecord::Base
  has_secure_password

  has_many :questions, foreign_key: :author_id
  has_many :answers, foreign_key: :author_id
  has_many :answered_questions, through: :answers, source: "question"

  before_create :default_avatar_url
  before_validation :downcase_email

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, format: { with: /\w+@\w+\.\w+/i }
  validates :avatar_url, format: { with: /\Ahttps?:\/\//i }, allow_nil: true

  def full_name
    "#{first_name} #{last_name}".titleize
  end

  private

  def default_avatar_url
    self.avatar_url ||= "http://movingkidsforward.org/wp-content/uploads/2013/05/profile_default800x600.jpg"
  end

  def downcase_email
    self.email = self.email.downcase if self.email.present?
  end
end