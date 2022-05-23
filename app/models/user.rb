class User < ApplicationRecord
  include Gravtastic

  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  # Юзер может создавать много событий
  has_many :events, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :subscriptions, dependent: :destroy

  gravtastic(secure: true, filetype: :png, size: 100, default: 'wavatar')

  validates :name, presence: true, length: {maximum: 35}
  
  validates :email, length: {maximum: 255}
  validates :email, uniqueness: true
  validates :email, format: /\A[a-zA-Z0-9\-_.]+@[a-zA-Z0-9\-_.]+\z/

  after_commit :link_subscriptions, on: :create

  mount_uploader :avatar, AvatarUploader

  private

  def link_subscriptions
    Subscription.where(user_id: nil, user_email: self.email)
      .update_all(user_id: self.id)
  end
end
