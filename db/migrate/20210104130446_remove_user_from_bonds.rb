class RemoveUserFromBonds < ActiveRecord::Migration[6.0]
  def change
    remove_reference :bonds, :user, null: false, foreign_key: true
    add_reference :bonds, :asset, index: true
  end
end
