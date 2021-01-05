class AddSourceToCashes < ActiveRecord::Migration[6.0]
  def change
    add_column :cashes, :sources, :text
  end
end
