class User < ApplicationRecord

  self.include_root_in_json = false
  include Tire::Model::Search
  include Tire::Model::Callbacks


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :profile
  before_create :build_default_profile
  after_touch() { tire.update_index }

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :nickname, presence: true

  has_many :messages
  has_many :subscriptions
  has_many :chats, through: :subscriptions

  has_friendship


  mapping do
    indexes :nickname, type: 'string'
    indexes :profile do
      indexes :firstname, type: 'string'
      indexes :secondname, type: 'string'
    end
  end


  def to_indexed_json
    to_json( include: { profile: { only: [:firstname, :secondname] } } )
  end


  private
    def build_default_profile
      build_profile
      true
    end



end
