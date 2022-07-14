class PhotoSendLetterJob < ApplicationJob
  queue_as :default

  def perform(photo, mail)
    EventMailer.photo(photo, mail)
  end
end
