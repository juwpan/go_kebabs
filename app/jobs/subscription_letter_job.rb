class SubscriptionLetterJob < ApplicationJob
  queue_as :default

  def perform(new_subscription)
    EventMailer.subscription(new_subscription)
  end
end
