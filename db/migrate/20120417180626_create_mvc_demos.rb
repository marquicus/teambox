class CreateMvcDemos < ActiveRecord::Migration
  def self.up
    create_table :mvc_demos do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :mvc_demos
  end
end
