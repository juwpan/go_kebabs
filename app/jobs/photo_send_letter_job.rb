class PhotoSendLetterJob < ApplicationJob
  queue_as :default

  def perform(event, photo)
    all_emails = (event.subscriptions.map(&:user_email) + [event.user.email]).uniq - [photo.user.email].uniq

    all_emails.each do |mail|
      EventMailer.photo(photo, mail).deliver_now
    end
  end
end
