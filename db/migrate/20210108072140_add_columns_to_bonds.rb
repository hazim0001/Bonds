class AddColumnsToBonds < ActiveRecord::Migration[6.0]
  def change
    add_column :bonds, :annual_return, :float
    add_column :bonds, :monthly_return, :float
    add_column :bonds, :quarterly_return, :float
    add_column :bonds, :compound, :float
  end
end
