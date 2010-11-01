require 'redmine'

Redmine::Plugin.register :redmine_outage_report do
  name 'Redmine Outage Report plugin'
  author 'Jacky Leung'
  description 'This is a outage report inspired by Arch Decisions plugin'
  version '0.0.1'
  url 'http://github.com/jk2l/redmine_outage_report'
  author_url 'http://github.com/jk2l'

  permission :outage_reports, {:outage_reports => [:index, :vote]}, :public => true
  menu :project_menu,
       :outage_reports,
       { :controller => 'outage_reports', :action => 'index' },
       :caption => 'Outage Report',
       :before => :settings,
       :param => :project_id

end
