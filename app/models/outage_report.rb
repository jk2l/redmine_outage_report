class OutageReport < ActiveRecord::Base
  unloadable
  
  has_many :issues, :class_name => "OutageReportIssue", :dependent => :destroy, :order => "relationships DESC"
  has_and_belongs_to_many :classifications,
                          :class_name => "ReportClassification",
                          :join_table => "outage_report_classifications"

  belongs_to :project
  belongs_to :author, :class_name => "User", :foreign_key => "author_id"
  belongs_to :report_status, :class_name => "ReportStatus", :foreign_key => 'report_status_id'


  acts_as_watchable

  validates_presence_of :title, :description
  
end
