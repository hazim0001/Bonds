class RemoveNullFromProperties < ActiveRecord::Migration[6.0]
  def change
    change_column :properties, :rent_amount_cents, :integer , default: 0
  end
end
