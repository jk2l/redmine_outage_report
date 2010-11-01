class CreateReportStatuses < ActiveRecord::Migration
  def self.up

    create_table :report_statuses do |t|
      t.column :name, :string, :null => false
      t.column "created_on", :timestamp
      t.column "updated_on", :timestamp
    end

    ReportStatus.create :name => "Ongoing"
    ReportStatus.create :name => "Pending"
    ReportStatus.create :name => "Resolved"

    change_table :outage_reports do |t|
      t.references :report_status, :class_name =>"ReportStatus", :foreign_key => true, :null => false
    end

  end

  def self.down
    drop_table :report_statuses

    change_table :outage_reports do |t|
      t.remove :report_status_id
    end
  end
end
