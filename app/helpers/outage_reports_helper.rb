module OutageReportsHelper
  def autotab
    @current_tab ||= 0
    @current_tab += 1
  end

  def classification_options(outage_report, classifications)
    options_from_collection_for_select(classifications, :id, :name, outage_report.outage_report_classifications)
  end
end
