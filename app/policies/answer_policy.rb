class AnswerPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def update?
    user == record.user
  end

  def delete?
    user == record.user
  end

  def upvote?
    true
  end

  def downvote?
    true
  end
end
