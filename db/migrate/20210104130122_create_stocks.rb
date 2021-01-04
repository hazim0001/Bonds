class CreateStocks < ActiveRecord::Migration[6.0]
  def change
    create_table :stocks do |t|
      t.string :symbol
      t.string :instrument
      t.float :position
      t.float :average_price
      t.float :cost_basis
      t.references :asset, null: false, foreign_key: true

      t.timestamps
    end
  end
end
