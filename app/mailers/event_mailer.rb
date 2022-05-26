class EventMailer < ApplicationMailer
  def photo(event, photo, email)
    @event = event
    @name = photo.user.name

    mail to: email, subject: "Добавлено новое фото для #{event.title}"
  end

  def subscription(event, subscription)
    @email = subscription.user_email
    @name = subscription.user_name
    @event = event
  
    # Берём у юзер его email
    # Subject тоже можно переносить в локали
    mail to: event.user.email, subject: "Новая подписка на #{event.title}"
  end

  def comment(event, comment, email)
    @comment = comment
    @event = event
  
    mail to: email, subject: "Новый комментарий @ #{event.title}"
  end
end
