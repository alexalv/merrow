class CreateSnapshots < ActiveRecord::Migration
  def change
    create_table :snapshots do |t|
      t.string :file
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
