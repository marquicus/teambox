# == Schema Information
#
# Table name: watchers
#
#  id             :integer(4)      not null, primary key
#  user_id        :integer(4)
#  project_id     :integer(4)
#  watchable_id   :integer(4)
#  watchable_type :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#
# Indexes
#
#  uniqueness_index                  (user_id,watchable_id,watchable_type) UNIQUE
#  watchers_uniqueness_index         (user_id,watchable_id,watchable_type) UNIQUE
#  index_watchers_on_user_id         (user_id)
#  index_watchers_on_watchable_id    (watchable_id)
#  index_watchers_on_watchable_type  (watchable_type)
#

class Watcher < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  belongs_to :watchable, :polymorphic => true

  before_save :copy_project_from_watchable

  private

    def copy_project_from_watchable
      self.project = watchable.project unless project || watchable.project.nil?
    end
end
