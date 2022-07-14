class CommentSendLetterJob < ApplicationJob
  queue_as :default

  def perform(comment, mail)
    EventMailer.comment(comment, mail).deliver_now
  end
end
