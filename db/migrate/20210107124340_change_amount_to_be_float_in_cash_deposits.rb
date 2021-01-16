class ChangeAmountToBeFloatInCashDeposits < ActiveRecord::Migration[6.0]
  def change
    change_column :cash_deposits, :amount, :float
  end
end
