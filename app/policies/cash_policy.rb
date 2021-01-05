class CashPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    raise
  end

  def show?
    record.asset == user.asset
  end

  def create?
    show?
  end

  def new?
    show?
  end

  def update?
    show?
  end

  def edit?
    show?
  end

  def destroy?
    show?
  end
end
