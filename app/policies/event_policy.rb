class EventPolicy < ApplicationPolicy
  def edit?
    user_is_owner?(record)
  end

  def update?
    user_is_owner?(record)
  end
  
  def destroy?
    user_is_owner?(record)
  end

  def show?
    true
  end
  
  class Scope < Scope
    def resolve
      scope.where(user: user) if user.present?
    end
  end

  private

    # def password_guard!(event)
    #   return true if event.pincode.blank?
    #   return true if user_is_owner?(event)
    
    #   if event.pincode.present? && event.pincode_valid?(event.pincode)
    #     event.pincode
    #   end
    
    #   # Проверяем, верный ли в куках пин-код
    #   # Если нет — ругаемся и рендерим форму ввода пин-кода
    #   # pincode = cookies.permanent["events_#{event.id}_pincode"]
    #   # unless event.pincode_valid?(pincode)
    #   #   if params[:pincode].present?
    #   #     flash.now[:alert] = I18n.t('controllers.events.wrong_pincode')
    #   #   end
    #   #   render 'password_form'
    #   # end
    # end

  def user_is_owner?(event)
    user.present?&&(event.try(:user) == user)
  end
end
