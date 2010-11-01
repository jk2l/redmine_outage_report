class OutageReportClassification < ActiveRecord::Base
  unloadable

  belongs_to :outage_report
  belongs_to :report_classification
 
end
