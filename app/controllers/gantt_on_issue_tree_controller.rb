class GanttOnIssueTreeController < ApplicationController
  unloadable
  helper :issues
  helper :gantt
  helper :queries
  include QueriesHelper
  
  def generate
    @issue = Issue.find(params[:issue_id])
    @query=IssueQuery.new(:name => '_')
    @query.add_filter('parent_id','~',[params[:issue_id]])

    @gantt = Redmine::Helpers::Gantt.new
    @query.group_by = nil
    @gantt.query = @query if @query.valid?
    render :template => 'gantts/show', :query => @query
    #redirect_to issues_path()
  end
end
