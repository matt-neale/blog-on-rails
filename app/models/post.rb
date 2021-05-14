class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  before_validation :capitalize_title # Thanks for showing me this!

  validates :title, presence: {message: "must be present!"}, uniqueness: true
  validates :body, presence: {message: "must be present!"}, length: {minimum: 50}

  private

  def capitalize_title
    self.title.capitalize!
  end
end
