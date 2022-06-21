class User < ApplicationRecord
  before_save { self.email = email.downcase }
  has_many :posts, dependent: :destroy
  
  validates :name, 
            uniqueness: true,
            length: { minimum: 1 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email,
            uniqueness: { case_sensitive: false },
            length: { maximum: 105 },
            format: { with: VALID_EMAIL_REGEX }

  has_secure_password
end
