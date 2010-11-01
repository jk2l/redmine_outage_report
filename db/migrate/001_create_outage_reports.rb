class CreateOutageReports < ActiveRecord::Migration
  def self.up
    create_table :outage_reports do |t|
      t.references :author, :class_name =>"User", :foreign_key => true, :null => false
      t.column :title, :text, :null => false
      t.column :description, :text, :null => false

      t.timestamps
    end

    add_index :outage_reports, :author_id, :name => :idx_author_id

    create_table :report_templates do |t|
      t.column :content, :text, :null => false
      
      t.timestamps
    end

    create_table :outage_report_issues do |t|
      t.references :outage_report, :null => false
      t.references :issue, :null => false
      t.column :relationships, :string, :null => false

      t.timestamps
    end

    add_index :outage_report_issues, :outage_report_id, :name => :idx_outage_report_id
    add_index :outage_report_issues, :issue_id, :name => :idx_issue_id

    create_table :report_classifications do |t|
      t.column :name, :string, :null => false

      t.timestamps
    end

    ReportClassification.create :name => "Server Problem"
    ReportClassification.create :name => "Database"
    ReportClassification.create :name => "Memcache"
    ReportClassification.create :name => "Coding Error"
    ReportClassification.create :name => "Version Compatibility"

    create_table :outage_report_classifications do |t|
      t.references :outage_report, :null => false
      t.references :report_classification, :null => false
    end

    add_index :outage_report_classifications, :outage_report_id, :name => :idx_outage_report_id
    add_index :outage_report_classifications, :report_classification_id, :name => :idx_report_classification_id

    create_table :report_discussions do |t|
      t.references :outage_report, :null => false
      t.references :author, :class_name =>"User", :foreign_key => true, :null => false
      t.column :content, :text

      t.timestamps 
    end

    add_index :report_discussions, :outage_report_id, :name => :idx_outage_report_id
    add_index :report_discussions, :author_id, :name => :idx_author_id
  end

  def self.down
    drop_table :outage_reports
    drop_table :report_classifications
    drop_table :report_templates
    drop_table :report_discussions

    drop_table :outage_report_issues
    drop_table :outage_report_classifications
    
  end
end
