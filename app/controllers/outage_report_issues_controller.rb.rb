class OutageReportIssuesController < ApplicationController
  unloadable

  def connect
    relationship = OutageReportIssue.new params[:new_relationship]
    relationship.save
  end

  def remove
    relationship = OutageReportIssue.first(:conditions => ["outage_report_id = ? and issue_id = ?", 
                                                            params[:outage_report_id], params[:issue_id]])
    relationship.delete
  end
end
