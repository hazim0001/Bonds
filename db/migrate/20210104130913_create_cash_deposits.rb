class CreateCashDeposits < ActiveRecord::Migration[6.0]
  def change
    create_table :cash_deposits do |t|
      t.references :cash, null: false, foreign_key: true
      t.float :amount
      t.string :source

      t.timestamps
    end
  end
end
