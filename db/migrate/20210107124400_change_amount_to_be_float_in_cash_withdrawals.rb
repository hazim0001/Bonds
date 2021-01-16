class ChangeAmountToBeFloatInCashWithdrawals < ActiveRecord::Migration[6.0]
  def change
    change_column :cash_withdrawals, :amount, :float
  end
end
