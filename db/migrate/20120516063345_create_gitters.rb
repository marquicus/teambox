class CreateGitters < ActiveRecord::Migration
  def self.up
    create_table :gitters do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :gitters
  end
end
