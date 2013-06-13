class CreateServers < ActiveRecord::Migration
  def change
    create_table :servers do |t|
      t.string :ip
      t.string :key
      t.text :hardware

      t.timestamps
    end
  end
end
