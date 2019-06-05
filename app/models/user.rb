class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :profile
  before_create :build_default_profile

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :nickname, presence: true

  searchkick

  private
    def build_default_profile
      build_profile
      true
    end

end
