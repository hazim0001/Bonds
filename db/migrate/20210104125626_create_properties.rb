class CreateProperties < ActiveRecord::Migration[6.0]
  def change
    create_table :properties do |t|
      t.float :value
      t.text :description
      t.string :location
      t.references :asset, null: false, foreign_key: true

      t.timestamps
    end
  end
end
