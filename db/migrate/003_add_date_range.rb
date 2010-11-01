class AddDateRange < ActiveRecord::Migration
  def self.up
    change_table :outage_reports do |t|
      t.timestamp :started_at, :null => false
    end

  end

  def self.down
    change_table :outage_reports do |t|
      t.remove :started_at
    end
  end
end
