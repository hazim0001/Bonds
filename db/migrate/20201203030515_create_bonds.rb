class CreateBonds < ActiveRecord::Migration[6.0]
  def change
    create_table :bonds do |t|
      t.integer :period
      t.string :terms
      t.date :start_date
      t.date :end_date
      t.float :interest_rate
      t.integer :amount
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
