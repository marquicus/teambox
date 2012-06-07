class CreateGitCommits < ActiveRecord::Migration
  def self.up
    create_table :git_commits do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :git_commits
  end
end
