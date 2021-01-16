class AddRentedToProperty < ActiveRecord::Migration[6.0]
  def change
    add_column :properties, :rented, :boolean, default: :false
  end
end
