class CashWithdrawalPolicy < ApplicationPolicy
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
    record.cash == user.cash
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
