class SubscriptionsController < ApplicationController
  # Задаем родительский event для подписки
  before_action :set_event, only: [:create, :destroy]

  # Задаем подписку, которую юзер хочет удалить
  before_action :set_subscription, only: [:destroy]

  def show
  end
  
  def create
    @new_subscription = @event.subscriptions.build(subscription_params)

    @new_subscription.user = current_user
  
    if @new_subscription.save
      SubscriptionSendLetterJob.perform_later(@new_subscription)
      
      redirect_to @event, notice: I18n.t('controllers.subscriptions.created')
    else
      render 'events/show'
    end
  end

  def destroy
    
    if current_user_can_edit?(@subscription)
      @subscription.destroy
    else
      message = {alert: I18n.t('controllers.subscriptions.error') }
    end
  
    redirect_to @event, notice: I18n.t('controllers.subscriptions.destroyed'), status: 303
  end

  private

  def subscription_params
    # .fetch разрешает в params отсутствие ключа :subscription
    params.fetch(:subscription, {}).permit(:user_email, :user_name)
  end

  def set_subscription
    @subscription = @event.subscriptions.find(params[:id])
  end

  def set_event
    @event = Event.find(params[:event_id])
  end
end
