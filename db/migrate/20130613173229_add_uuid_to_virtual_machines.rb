class AddUuidToVirtualMachines < ActiveRecord::Migration
  def change
    add_column :virtual_machines, :uuid, :string
  end
end
