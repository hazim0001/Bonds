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

    # add_monetize :assets, :total_value

    # add_monetize :cashes, :amount

    # add_monetize :cash_deposits, :amount

    # add_monetize :cash_transactions, :amount

    # add_monetize :cash_withdrawals, :amount

    # add_monetize :properties, :value

    # add_monetize :stocks, :cost_basis
    # add_monetize :stocks, :average_price

    # add_monetize :bonds, :amount
    # add_monetize :bonds, :annual_return
    # add_monetize :bonds, :monthly_return
    # add_monetize :bonds, :quarterly_return
    # add_monetize :bonds, :compound
  end
end
