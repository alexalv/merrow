class AddVmconfigIdToVirtualMachine < ActiveRecord::Migration
  def change
    add_column :virtual_machines, :vmconfig_id, :integer
    remove_column :virtual_machines, :config
  end
end
