# == Schema Information
#
# Table name: git_commits
#
#  id         :integer(4)      not null, primary key
#  created_at :datetime
#  updated_at :datetime
#

class GitCommit < ActiveRecord::Base
end
