class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  before_validation :capitalize_title

  validates :title, presence: {message: "Must have title!"}, uniqueness: true
  validates :body, presence: {message: "Must have body!"}, length: {minimum: 50}

  private

  def capitalize_title
    self.title.capitalize!
  end
end
