class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  validates :body, presence: {message: 'must be present!'} # validation message doesn't come up?
end
