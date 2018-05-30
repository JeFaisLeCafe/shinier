class QuestionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def autocomplete?
    true
  end

  def create?
    return true
  end

end
