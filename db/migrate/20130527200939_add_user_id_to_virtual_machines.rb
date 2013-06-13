class AddUserIdToVirtualMachines < ActiveRecord::Migration
  def change
    add_column :virtual_machines, :user_id, :integer
  end
end
