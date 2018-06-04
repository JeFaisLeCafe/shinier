class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def create?
    true
  end

  def update?
    true
    # record.user == user
  end

  def destroy
    record.user == user
  end
end
