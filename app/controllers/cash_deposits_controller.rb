class CashDepositsController < ApplicationController
  def new
  end

  def create
    raise
  end

  def destroy
  end

  def index
  end

  private

  def cash_deposit_params
    params.require(:cash_deposit).permit(:source, :amount, :cash_id)
  end
end
