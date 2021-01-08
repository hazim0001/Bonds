class AddNullToAll < ActiveRecord::Migration[6.0]
  def change
    change_column :assets, :total_value_cents, :integer, default: 0, null: false

    change_column :cashes, :amount_cents, :integer, default: 0, null: false

    change_column :cash_deposits, :amount_cents, :integer, default: 0, null: false

    change_column :cash_transactions, :amount_cents, :integer, default: 0, null: false

    change_column :cash_withdrawals, :amount_cents, :integer, default: 0, null: false

    change_column :properties, :value_cents, :integer, default: 0, null: false

    change_column :stocks, :cost_basis_cents, :integer, default: 0, null: false
    change_column :stocks, :average_price_cents, :integer, default: 0, null: false

    change_column :bonds, :amount_cents, :integer, default: 0, null: false
    change_column :bonds, :annual_return_cents, :integer, default: 0, null: false
    change_column :bonds, :monthly_return_cents, :integer, default: 0, null: false
    change_column :bonds, :quarterly_return_cents, :integer, default: 0, null: false
    change_column :bonds, :compound_cents, :integer, default: 0, null: false
  end
end
