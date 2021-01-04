class CashDepositPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    raise
  end

  def show?
    raise
  end

  def create?
    raise
  end

  def new?
    raise
  end

  def update?
    raise
  end

  def edit?
    raise
  end

  def destroy?
    raise
  end
end
