class AddFilenameToVirtualMachines < ActiveRecord::Migration
  def change
    add_column :virtual_machines, :filename, :string
  end
end
