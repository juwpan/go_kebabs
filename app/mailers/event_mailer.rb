class EventMailer < ApplicationMailer
  def photo(photo, email)
    @event = photo.event
    @name = photo.user.name

    mail(to: email, subject: default_i18n_subject(event: photo.event.title))
  end

  def user(user)
    @user = user.name
    @url = 'localhost:3000'

    mail(to: @user.email, subject: default_i18n_subject(event: user.name))
  end

  def subscription(subscription)
    @email = subscription.user_email
    @name = subscription.user_name
    @event = subscription.event

    mail(to: @email, subject: default_i18n_subject(event: subscription.event.title))
  end

  def comment(comment, email)
    @comment = comment
    @event = @comment.event
    
    mail(to: email, subject: default_i18n_subject(event: @event.title))
  end
end
