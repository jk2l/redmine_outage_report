class OutageReportsController < ApplicationController
  unloadable

  before_filter :find_project
  before_filter :find_report, :except => [:index, :new]
  before_filter :find_available_fields, :only => [:new, :edit]

  def index
    limit = per_page_option
    @report_count = OutageReport.count
    @report_pages = Paginator.new self, @report_count, limit, params['page']
    @reports = OutageReport.find(:all, :offset => @report_pages.current.offset, :limit => limit)
    render :layout => !request.xhr?
  end

  def show
    @options = OutageReportIssue.all
  end

  def new
    @outage_report = OutageReport.new(params[:outage_report])
    @outage_report.project = @project
    
    @outage_report.started_at = Date.today
    if request.post?
      @outage_report.author = User.current
      if @outage_report.save
        flash[:notice] = l(:notice_successful_create)
        redirect_to( :action => 'show', :project_id => @project, :id => @outage_report )
      end
    end
  end

  def edit
    if request.post?
      if @outage_report.update_attributes(params[:outage_report])
        flash[:notice] = l(:notice_successful_update)
        redirect_to :action => 'show', :project_id => @project, :id => @outage_report
      end
    end
  end

  def destroy
    @outage_report.destroy if request.post?
    redirect_to :action => 'index', :project_id => @project
  end

  private
  def find_project
    @project = Project.find(params[:project_id])
  end

  def find_report
    @outage_report = OutageReport.find(params[:id])
  end

  def find_available_fields
    @report_classifications = ReportClassification.find(:all)
    @report_statuses = ReportStatus.find(:all)
  end
end
