class NotifyUserJob < ApplicationJob
  queue_as :default

  def perform(current_user)
    raise
    due_bonds = current_user.bonds.where(end_date: Date.today - 1)

    # redirect_to asset_bonds_path(current_user.asset), notice: "Your bond has been created"
    # flash[:notice] = 'Successfully checked in'
    # [:notice] = "Your bond has been created"
  end
end
