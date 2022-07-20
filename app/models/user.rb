class User < ApplicationRecord
  include Gravtastic
  
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable, :confirmable,
  :omniauthable, omniauth_providers: [:vkontakte, :github, :google_oauth2]

  has_many :events, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :subscriptions, dependent: :destroy
  has_many :photos, dependent: :destroy

  has_one_attached :avatar do |attachable|
    attachable.variant :thumb, resize_to_fill: [300, 300]
  end

  gravtastic(secure: true, filetype: :png, size: 100, default: 'wavatar')

  validates :name, presence: true, length: {maximum: 35}
  
  validates :email, length: {maximum: 255}
  validates :email, uniqueness: true
  validates :email, format: /\A[a-zA-Z0-9\-_.]+@[a-zA-Z0-9\-_.]+\z/

  after_commit :link_subscriptions, on: :create

  def send_devise_notification(notification, *args)
    devise_mailer.send(notification, self, *args).deliver_later
  end

  def self.create_from_provider_data(provider_data)
    # Достаём email из токена
    email = provider_data.info.email
    user = where(email: email).first

    # Возвращаем, если нашёлся
    return user if user.present?

    # Если не нашёлся, достаём провайдера, айдишник и uid
    provider = provider_data.provider
    id = provider_data.extra.raw_info.id
    uid = "#{id}"

    # Теперь ищем в базе запись по провайдеру и uid
    # Если есть, то вернётся, если нет, то будет создана новая
    where(uid: uid, provider: provider).first_or_create! do |user|
      # Если создаём новую запись, прописываем email и пароль
      user.name = provider_data.info.name
      user.email = email
      user.password = Devise.friendly_token.first(16)
      user.confirmed_at = Time.now.utc
    end
  end

  private
  
  def link_subscriptions
    Subscription.where(user_id: nil, user_email: self.email)
      .update_all(user_id: self.id)
  end
end
