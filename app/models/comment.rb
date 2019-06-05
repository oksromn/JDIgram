class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  validates :comment, presence: true, allow_blank: false
  validates :user_id, presence: true
end
