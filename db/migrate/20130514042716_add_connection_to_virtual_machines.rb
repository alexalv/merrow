class AddConnectionToVirtualMachines < ActiveRecord::Migration
  def change
  	add_column :virtual_machines, :connection_s, :string
  end
end
