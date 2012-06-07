# == Schema Information
#
# Table name: git_repositories
#
#  id         :integer(4)      not null, primary key
#  created_at :datetime
#  updated_at :datetime
#

class GitRepository < ActiveRecord::Base
end
