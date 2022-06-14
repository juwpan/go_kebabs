class Photo < ApplicationRecord
  belongs_to :event
  belongs_to :user

  validates :photo, presence: true

  has_one_attached :photo do |attachable|
    attachable.variant :thumb, resize_to_fill: [100, 100]
  end

  scope :persisted, -> { where "id IS NOT NULL"}
end
