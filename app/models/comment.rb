class Comment < ApplicationRecord
  belongs_to :post

  validates :body, presence: {message: 'Must have body'}
end
