class AnswerPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def mark_as_read?
    true
  end

  def set_notifications
   true
  end
end
