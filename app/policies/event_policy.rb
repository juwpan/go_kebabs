class EventPolicy < ApplicationPolicy
  def create?
    user.present?
  end

  def update?
    user_is_owner?(record)
  end

  def destroy?
    user_is_owner?(record)
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
end
