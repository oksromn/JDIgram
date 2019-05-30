class Profile < ApplicationRecord
  belongs_to :user
  validates :nickname, :firstname, :secondname, :birthday, presence: true


end
