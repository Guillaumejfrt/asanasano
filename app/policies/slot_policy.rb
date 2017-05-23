class SlotPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def create?
    user_is_group_owner_or_coach?
  end

  def update?
    user_is_group_owner_or_coach?
  end

  # on teste ici si le user est le créateur du groupe ou le coach du cours.
  def user_is_group_owner_or_coach?
    record.course.group.owner == user || record.course.coach == user
  end
end