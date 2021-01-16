class CreatePayouts < ActiveRecord::Migration[6.0]
  def change
    create_table :payouts do |t|
      t.monetize :amount, default: 0
      t.datetime :payout_date
      t.references :bond, null: false, foreign_key: true

      t.timestamps
    end
  end
end
