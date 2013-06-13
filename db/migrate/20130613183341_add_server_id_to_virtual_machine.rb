class AddServerIdToVirtualMachine < ActiveRecord::Migration
  def change
    add_column :virtual_machines, :server_id, :int
  end
end
