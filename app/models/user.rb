class User < ApplicationRecord

  has_secure_password

  has_many :posts
  has_many :comments

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  
  validates :first_name, :last_name, presence: true
  validates :email, presence: true, uniqueness: :true, format: VALID_EMAIL_REGEX


  def full_name
    "#{first_name} #{last_name}".strip.titleize
  end
end
