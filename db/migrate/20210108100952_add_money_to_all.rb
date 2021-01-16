class AddMoneyToAll < ActiveRecord::Migration[6.0]
  def change
    rename_column :assets, :total_value,  :total_value_cents

    rename_column :cashes, :amount,  :amount_cents

    rename_column :cash_deposits, :amount,  :amount_cents

    rename_column :cash_transactions, :amount,  :amount_cents

    rename_column :cash_withdrawals, :amount,  :amount_cents

    rename_column :properties, :value,  :value_cents

    rename_column :stocks, :cost_basis,  :cost_basis_cents
    rename_column :stocks, :average_price,  :average_price_cents

    rename_column :bonds, :amount,  :amount_cents
    rename_column :bonds, :annual_return,  :annual_return_cents
    rename_column :bonds, :monthly_return,  :monthly_return_cents
    rename_column :bonds, :quarterly_return,  :quarterly_return_cents
    rename_column :bonds, :compound,  :compound_cents




    change_column :assets, :total_value_cents, :integer

    change_column :cashes, :amount_cents, :integer

    change_column :cash_deposits, :amount_cents, :integer

    change_column :cash_transactions, :amount_cents, :integer

    change_column :cash_withdrawals, :amount_cents, :integer

    change_column :properties, :value_cents, :integer

    change_column :stocks, :cost_basis_cents, :integer
    change_column :stocks, :average_price_cents, :integer

    change_column :bonds, :amount_cents, :integer
    change_column :bonds, :annual_return_cents, :integer
    change_column :bonds, :monthly_return_cents, :integer
    change_column :bonds, :quarterly_return_cents, :integer
    change_column :bonds, :compound_cents, :integer
  end
end
