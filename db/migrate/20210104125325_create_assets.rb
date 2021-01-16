class CreateAssets < ActiveRecord::Migration[6.0]
  def change
    create_table :assets do |t|
      t.float :total_value
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
