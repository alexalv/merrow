class CreateVirtualMachines < ActiveRecord::Migration
  def change
    create_table :virtual_machines do |t|
      t.text :description
      t.text :config
      t.string :name
      t.string :macaddr

      t.timestamps
    end
  end
end
