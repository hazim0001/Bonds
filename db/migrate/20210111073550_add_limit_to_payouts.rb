class AddLimitToPayouts < ActiveRecord::Migration[6.0]
  def change
    remove_column :payouts, :amount_currency, :string
    change_column :payouts, :amount_cents, :integer, :limit => 8
  end
end
