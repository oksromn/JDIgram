class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :profile
  before_create :build_default_profile
  has_many :user, dependent: :destroy
  validates :nickname, presence: true

  private
  def build_default_profile
    build_profile
    true
  end

end
