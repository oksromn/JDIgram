class Profile < ApplicationRecord

  belongs_to :user, touch: true

  User.tire.index.refresh


  mount_uploader :photo, PhotoUploader
  serialize :photo, JSON
end
