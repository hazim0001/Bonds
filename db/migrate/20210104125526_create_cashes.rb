class CreateCashes < ActiveRecord::Migration[6.0]
  def change
    create_table :cashes do |t|
      t.float :amount
      t.references :asset, null: false, foreign_key: true

      t.timestamps
    end
  end
end
