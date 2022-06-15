module EventsHelper
  def subscriptions_user?(event, current_user)
    event.subscriptions.each do |user|
      if user_signed_in? && current_user.email == user.user_email && current_user.email
        return true
      end
    end
  end
end
