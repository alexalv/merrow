class AddImageToVirtualMachine < ActiveRecord::Migration
  def change
  	add_column :virtual_machines, :image, :string
  end
end
