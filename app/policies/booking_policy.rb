class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
     true
  end

  def create?
     true
  end

  def update?
    record.user == user || user.admin # Only restaurant creator can update it
  end

  def destroy?
    record.user == user || user.admin # Only restaurant creator can update it
  end
end
