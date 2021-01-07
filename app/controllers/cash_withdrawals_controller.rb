class CashWithdrawalsController < ApplicationController
  def new
  end

  def create
    # raise
    @cash_withdrawal = CashWithdrawal.new(cash_withdrawal_params)
    @cash = @cash_withdrawal.cash
    @cash.update(amount: @cash.amount - @cash_withdrawal.amount)
    authorize @cash_withdrawal
    if @cash_withdrawal.save
      CashTransaction.create(user: current_user, amount: cash_withdrawal.amount, action: "withdraw")
      redirect_to asset_cashes_path(@cash.asset), notice: "Your withdrawal has been made"
    else
      redirect_to asset_cashes_path(@cash.asset), notice: "Your cash withdrawal has NOT been made"
    end
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
