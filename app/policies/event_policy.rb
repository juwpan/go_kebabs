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
    password_guard!(record)
  end
  
  class Scope < Scope
    def resolve
      scope.where(user: user) if user.present?
    end
  end

  private

  def user_is_owner?(event)
    user.present?&&(event.try(:user) == user)
  end

  def password_guard!(event)
    return true if event.pincode.blank?
    return true if event.pincode.present? && user_is_owner?(event)
    
    false
  end
end
