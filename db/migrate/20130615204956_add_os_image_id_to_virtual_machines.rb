class AddOsImageIdToVirtualMachines < ActiveRecord::Migration
  def change
    add_column :virtual_machines, :os_image_id, :integer
    remove_column :virtual_machines, :image
  end
end
