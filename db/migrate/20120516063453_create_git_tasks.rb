class CreateGitTasks < ActiveRecord::Migration
  def self.up
    create_table :git_tasks do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :git_tasks
  end
end
