class Post < ApplicationRecord
  validates :title, presence: true
  validates :body, presence:{minimum: 50}
end
