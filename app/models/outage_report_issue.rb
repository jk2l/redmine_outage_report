class OutageReportIssue < ActiveRecord::Base
  unloadable

  belongs_to :outage_report
  belongs_to :issue

  def self.available_report_to_issue
    return ["Caused by", "Created"]
  end

  def self.available_issue_to_report
    return ["Caused", "Created by"]
  end
end
