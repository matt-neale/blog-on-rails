class Post < ApplicationRecord
  validates :title, presence: {message: "Must have title!"}, uniqueness: true
  validates :body, presence:{minimum: 50}
end
