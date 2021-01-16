class AddDetailsToCashTransactions < ActiveRecord::Migration[6.0]
  def change
    add_column :cash_transactions, :details, :string
  end
end
