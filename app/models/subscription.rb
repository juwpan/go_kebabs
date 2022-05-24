class Subscription < ApplicationRecord
  belongs_to :event
  belongs_to :user, optional: true
  
  validates :user, uniqueness: { scope: :event_id }, if: -> { user.present?}
  validate :subscription_ban, if: -> { user.present?}

  validates :user_name, presence: true, unless: -> { user.present? }
  validates :user_email, uniqueness: { scope: :event_id }, unless: -> { user.present?}
  validates :user_email, presence: true, format: /\A[a-zA-Z0-9\-_.]+@[a-zA-Z0-9\-_.]+\z/, unless: -> { user.present? }
  validate :user_exist, unless: -> { user.present? }
    
  def user_name
    if user.present?
      user.name
    else
      super
    end
  end
  
  def user_email
    if user.present?
      user.email
    else
      super
    end
  end

  private

  def subscription_ban
    errors.add(:user, :ban) if event.user == user
  end

  def user_exist
    errors.add(:user_email, :another_user) if User.where(email: user_email.downcase).exists?
  end
end
