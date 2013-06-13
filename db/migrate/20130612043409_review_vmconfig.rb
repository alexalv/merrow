class ReviewVmconfig < ActiveRecord::Migration
  def change
    add_column :vmconfigs, :memory, :integer
    add_column :vmconfigs, :vcpu, :integer
    remove_column :vmconfigs, :config
  end
end
