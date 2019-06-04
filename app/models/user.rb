class User < ApplicationRecord

  #include Elasticsearch::Model
  #include Elasticsearch::Model::Callbacks

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :profile
  before_create :build_default_profile

  has_many :posts, dependent: :destroy

  validates :nickname, presence: true


  searchkick

  private
  def build_default_profile
    build_profile
    true
  end

end
