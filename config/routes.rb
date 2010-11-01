ActionController::Routing::Routes.draw do |map|
  map.connect 'projects/:project_id/outage_reports/:action/:id', :controller => 'outage_reports'
end
