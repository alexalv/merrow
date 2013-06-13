class CreateVmconfigs < ActiveRecord::Migration
  def change
    create_table :vmconfigs do |t|
      t.string :name
      t.text :description
      t.text :config

      t.timestamps
    end
  end
end
