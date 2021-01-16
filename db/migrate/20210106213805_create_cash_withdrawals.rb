class CreateCashWithdrawals < ActiveRecord::Migration[6.0]
  def change
    create_table :cash_withdrawals do |t|
      t.integer :amount
      t.string :reason
      t.references :cash, null: false, foreign_key: true

      t.timestamps
    end
  end
end
