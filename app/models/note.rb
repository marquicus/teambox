# == Schema Information
#
# Table name: notes
#
#  id              :integer(4)      not null, primary key
#  page_id         :integer(4)
#  project_id      :integer(4)
#  name            :string(255)
#  body            :text
#  body_html       :text
#  position        :integer(4)
#  last_comment_id :integer(4)
#  created_at      :datetime
#  updated_at      :datetime
#  deleted         :boolean(1)      default(FALSE), not null
#
# Indexes
#
#  index_notes_on_deleted     (deleted)
#  index_notes_on_page_id     (page_id)
#  index_notes_on_project_id  (project_id)
#

class Note < RoleRecord
  include Immortal

  belongs_to :page
  belongs_to :project
  has_one :page_slot, :as => :rel_object
  versioned
  
  include PageWidget
  
  before_destroy :clear_slot
  after_create :save_slot, :log_create
  after_update :touch_updated
  
  formats_attributes :body
  
  attr_accessor :deleted
  attr_accessible :body, :deleted, :name
  
  def log_create
    project.log_activity(self, 'create', updated_by.id)
  end
  
  def touch_updated
    project.log_activity(self, 'edit', updated_by.id)
  end
  
  def slot_view
    'notes/note'
  end
  
  def references
    refs = { :projects => [project_id], :pages => [page_id] }
    refs[:page_slot] = [page_slot.id] if page_slot
    refs
  end
  
  def to_s
    name
  end
  
  def to_xml(options = {})
    options[:indent] ||= 2
    xml = options[:builder] ||= Builder::XmlMarkup.new(:indent => options[:indent])
    xml.instruct! unless options[:skip_instruct]
    xml.note :id => id do
      xml.tag! 'page-id',      page_id
      xml.tag! 'project-id',   project_id
      xml.tag! 'name',         name
      xml.tag! 'body',         body
      xml.tag! 'created-at',   created_at.to_s(:db)
      xml.tag! 'updated-at',   updated_at.to_s(:db)
    end
  end
  
  def to_api_hash(options = {})
    base = {
      :id => id,
      :project_id => project_id,
      :page_id => page_id,
      :slot_id => page_slot.id,
      :name => name,
      :body => body,
      :body_html => body_html,
      :created_at => created_at.to_s(:api_time),
      :updated_at => updated_at.to_s(:db)
    }
    
    base[:type] = self.class.to_s if options[:emit_type]
    
    base
  end
  
end