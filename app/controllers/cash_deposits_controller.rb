class CashDepositsController < ApplicationController
  def new
  end

  def create
    @cash_deposit = CashDeposit.new(cash_deposit_params)
    @cash = @cash_deposit.cash
    @cash.update(amount: @cash.amount + @cash_deposit.amount)
    authorize @cash_deposit
    if @cash_deposit.save
      CashTransaction.create(user: current_user, amount: cash_deposit.amount, action: "deposit")
      redirect_to asset_cashes_path(@cash.asset), notice: "Your deposit has been made"
    else
      redirect_to asset_cashes_path(@cash.asset), notice: "Your cash deposit has NOT been made"
    end
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
