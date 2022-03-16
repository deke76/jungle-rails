class User < ActiveRecord::Base

  has_secure_password

  before_save { self.email_lower = email.downcase }
  
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
  validates :password, length: { minimum: 6 }

  def self.authenticate_with_credentials(email, password)
    valid_user = User.find_by email_lower: email.strip.downcase
    puts 'line 15'
    puts valid_user
    if !valid_user.authenticate(password)
      valid_user = nil
    end
    valid_user
  end
end
