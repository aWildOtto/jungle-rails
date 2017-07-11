class User < ActiveRecord::Base

  def self.authenticate_with_credentials (email, password)
    user = User.find_by_email(email.downcase.strip)
    if !user
      nil
    else
      user.authenticate(password)? user : nil
    end
  end


  validates :email, uniqueness: true

  validates :password, presence: true
  validates :password, confirmation: true
  validates :password, length: {minimum: 6, maximum: 20}
  
  validates :first_name, presence: true
  validates :last_name, presence: true


  has_secure_password
  has_many :reviews


end
