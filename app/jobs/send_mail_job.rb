class SendMailJob < ApplicationJob
  queue_as :default

  def perform(model)
    event = model.event
    all_emails = (event.subscriptions.map(&:user_email) + [event.user.email]).uniq - [model.user.email].uniq

    case model
    when Subscription
      EventMailer.subscription(model).deliver_later
    when Comment
      all_emails.each { |mail| EventMailer.comment(model, mail).deliver_later }
    when Photo
      all_emails.each { |mail| EventMailer.photo(model, mail).deliver_later }
    end
  end
end
