class AddStateToVirtualMachine < ActiveRecord::Migration
  def change
    add_column :virtual_machines, :state, :string
  end
end
