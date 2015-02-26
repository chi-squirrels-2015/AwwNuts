class User < ActiveRecord::Base
  has_secure_password

  before_validation :downcase_email

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, format: { with: /\w+@\w+\.\w+/i }
  validates :avatar_url, format: { with: /\Ahttps?:\/\//i }

  private

  def downcase_email
    self.email = self.email.downcase if self.email.present?
  end
end