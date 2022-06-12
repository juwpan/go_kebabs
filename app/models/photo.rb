class Photo < ApplicationRecord
  belongs_to :event
  belongs_to :user

  validates :event, presence: true
  validates :user, presence: true
  validates :photo, presence: true

  has_one_attached :photo do |attachable|
    attachable.variant :thumb, resize_to_fill: [100, 100]
  end

  # mount_uploader :photo, PhotoUploader

  scope :persisted, -> { where "id IS NOT NULL"}
end
