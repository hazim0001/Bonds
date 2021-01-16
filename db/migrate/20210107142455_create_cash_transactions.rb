class CreateCashTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :cash_transactions do |t|
      t.references :user, null: false, foreign_key: true
      t.float :amount
      t.string :action

      t.timestamps
    end
  end
end
