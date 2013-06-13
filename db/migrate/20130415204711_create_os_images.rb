class CreateOsImages < ActiveRecord::Migration
  def change
    create_table :os_images do |t|
      t.string :system
      t.string :file
      t.text :description

      t.timestamps
    end
  end
end
