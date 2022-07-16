class SendMailJob < ApplicationJob
  queue_as :default

  def perform(argument)
    event = argument.event
    all_emails = (event.subscriptions.map(&:user_email) + [event.user.email]).uniq - [argument.user.email].uniq 

    case argument
    when Subscription
      EventMailer.subscription(argument).deliver_now
    when Comment
      all_emails.each {|mail| EventMailer.comment(argument, mail).deliver_now }
    when Photo
      all_emails.each {|mail| EventMailer.photo(argument, mail).deliver_now }
    end
  end
end
