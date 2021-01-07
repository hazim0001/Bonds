class CashWithdrawalsController < ApplicationController
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

  def cash_withdrawal_params
    params.require(:cash_withdrawal).permit(:reason, :amount, :cash_id)
  end
end
